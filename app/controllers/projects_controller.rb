class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    helper_method :params

    def index
        @user = current_user
        @clients = Client.all
        if !params[:client].blank?
            @projects = Project.by_client(params[:client])
            # @client = Client.find(params[:id])
            # @projects = @client.projects
        else
            @projects = @user.projects.all
        end
    end
    
    def show
    end

    def new
        if params[:client_id]
            @client = Client.find(params[:client_id])
            @project = @client.projects.build
        else
            @project = Project.new
        end
    end

    def edit
    end


    def create
        # byebug
        @project = current_user.projects.build(project_params)
        respond_to do |format|
        if @project.save
            format.html { redirect_to projects_path, notice: 'Projects was successfully created!' }
        else
            format.html { redirect_to 'new'}
        end
    end
    end


    def update
        @project.update(project_params)
        redirect_to @project
    end

    def destroy
        @project.destroy
        redirect_to projects_path
    end

    private

    def set_project
        # byebug
        @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:name, :description, :completed, :client_id)
    end
end