class DevelopersController < ApplicationController
    before_action :set_developer, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @devs = Developer.all
    end

    def new
        @dev = Developer.new
        @dev.projects.build
    end

    def edit
    end


    def create
        @dev = Developer.new(dev_params)
        if @dev.save
            redirect_to @dev
        else
            @errors = @dev.errors.full_messages
            redirect_to 'new'
        end
    end

    def show
    end


    def update
        @dev.update(dev_params)
        redirect_to @dev
    end

    def destroy
        @dev.destroy
        redirect_to @devs
    end

    private

    def set_developer
        @dev = Developer.find(params[:id])
    end

    def dev_params
        params.require(:developer).permit(:name, :email, :password, :phone_number, :address, projects_attributes:[:name, :description, :completed])
    end
end