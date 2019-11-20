class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    protected

    def after_sign_in_path_for(resource)
        @user = current_user
        user_path(@user)
    end

end
