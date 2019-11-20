class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    helper_method :params

    def index
        @user = current_user
        @clients = Client.all
        if !params[:client].blank?
            @projects = Project.by_client(params[:client])
        else
            @projects = @user.projects.all
        end
    end
    
    def show
    end

    def new
        if params[:client_id]
            @client = Client.find_or_create_by(id: params[:client_id])
            @project = @client.projects.build
        else
            @project = Project.new
        end
    end

    def edit
    end


    def create
        @project = current_user.projects.build(project_params)
            if @project.save
                redirect_to client_path(@project.client.id), notice: 'Project was successfully created!'
            else
                redirect_to 'new', notice: 'Project was not created!'
            end
    end


    def update
        if @project.update(project_params)
            redirect_to @project, notice: 'Project was successfully updated!'
        else
            flash[:notice] = 'Client was not updated!'
            redirect_to new_project_path
        end
    end

    def destroy
        @project.destroy
        redirect_to client_path(@project.client.id), notice: 'Project was successfully deleted.'
    end

    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :description, :completed, :client_id)
    end
end