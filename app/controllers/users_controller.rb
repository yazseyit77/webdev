class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @users = User.all
    end

    def show

    end

    
    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :phone_number, :address, projects_attributes:[:name, :description, :completed])
    end
end