class ClientsController < ApplicationController
    before_action :set_client, only: [:show, :edit, :update, :destroy]

    def index
        @user = current_user
        @clients = @user.clients.sort_by{|w| w.created_at  }.uniq
    end

    def new
        if current_user
            @client = current_user.clients.new
            @client.projects.build
        else
            redirect_to login_path
        end
    end

    def edit
    end


    def create
        @client = current_user.clients.new(client_params)
            if @client.save
                redirect_to @client, notice: 'Client was successfully created!'
            else
                flash.now[:errors] = @client.errors.full_messages
                render 'new'
            end
    end

    def show
    end


    def update
        if current_user && @client.users.include?(current_user) 
            @client.update(client_params)
            redirect_to @client, notice: 'Client was successfully updated.'
        else
            flash.now[:notice] = 'Client was not updated!'
            render :edit
        end
    end

    def destroy
        @client.destroy
        respond_to do |format|
            format.html { redirect_to clients_path, notice: 'Client was successfully deleted.' }
        end
    end

    private

    def set_client
        @client = Client.find(params[:id])
    end

    def client_params
        params.require(:client).permit(:name, :email, :password, :phone_number, :address, projects_attributes:[:name, :description, :completed])
    end
end