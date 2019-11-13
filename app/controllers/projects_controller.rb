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
        respond_to do |format|
            if @project.save
                format.html { redirect_to client_path(@project.client.id), notice: 'Project was successfully created!' }
            else
                format.html { redirect_to 'new', notice: 'Project was not created!' }
            end
        end
    end


    def update
        respond_to do |format|
            if @project.update(project_params)
                format.html { redirect_to @project, notice: 'Project was successfully created!' }
            else
                format.html { redirect_to new_peoject_path, notice: 'Project was not created!' }
            end
        end
    end

    def destroy
        @project.destroy
        respond_to do |format|
            format.html { redirect_to client_path(@project.client.id), notice: 'Project was successfully deleted.' }
        end
    end

    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :description, :completed, :client_id)
    end
end