class ApplicationController < ActionController::Base
    def home
        
    end

    def after_sign_in_path_for(resource)
        stored_location_for(resource) || home
    end
end
