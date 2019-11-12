class ApplicationController < ActionController::Base
    def home
        
    end

    protected

    def after_sign_in_path_for(resource)
        @user = current_user
        user_path(@user)
    end

end
