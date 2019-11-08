class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
    # before_action :authenticate_project!, except: [:index, :show]

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def edit
    end


    def create
        @project = Project.new(project_params)
        @project.save!
    end

    def show
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