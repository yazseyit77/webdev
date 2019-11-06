class DevelopersController < ApplicationController
    # before_action :set_developer, only: [:show, :edit, :update, :destroy]

    def index
        @devs = Developer.all
    end

    def new
        @dev = Developer.new
    end

    def edit

    end


    def create
        @dev = Developer.new(dev_params)
        @dev.save
        redirect_to @dev
    end

    def show
        @dev = Developer.find_by(params[:id])
    end

   
    def update

    end

    def destroy

    end

    private

    def set_developer
        @dev = Developer.find(params[:id])
    end

    def dev_params
        params.require(:developer).permit(:name, :email, :password, :phone_number, :address)
    end
end