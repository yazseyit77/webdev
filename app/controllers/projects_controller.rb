class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        if params[:id]
            @client = Client.find(params[:id])
            @projects = @client.projects
        else
            @projects = Project.all
        end
    end
    
    def show
    end

    def new
        if params[:id]
            @client = Client.find(params[:id])
            @project = @client.projects.build
        else
            @project = Project.new
        end
    end

    def edit
    end


    def create
        self.create(project_params)
        # # @project.user_id = current_user.id
        # # @project.client_id = 2
        # @project.save!
    end


    def update
        @project.update(project_params)
        redirect_to @project
    end

    def destroy
        @project.destroy
        redirect_to @projects
    end

    private

    def set_project
        @project = Project.find[params[:id]]
    end

    def project_params
        params.require(:project).permit(:name, :description, :completed)
    end
end