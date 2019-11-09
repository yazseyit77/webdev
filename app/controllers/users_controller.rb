class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    before_action :authenticate_user!, except: [:index, :show]

    def index
        @users = User.all
    end

    def show

    end

    # def new
    #     @user = User.new
    #     @user.projects.build
    # end

    # def edit
    # end


    # def create
    #     @user = User.new(user_params)
    #     if @user.save
    #         redirect_to @user
    #     else
    #         @errors = @user.errors.full_messages
    #         redirect_to 'new'
    #     end
    # end

 


    # def update
    #     @user.update(user_params)
    #     redirect_to @user
    # end

    # def destroy
    #     @user.destroy
    #     redirect_to @users
    # end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :phone_number, :address, projects_attributes:[:name, :description, :completed])
    end
end