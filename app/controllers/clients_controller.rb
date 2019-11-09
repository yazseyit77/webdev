class ClientsController < ApplicationController
    before_action :set_client, only: [:show, :edit, :update, :destroy]

    def index
        @user = current_user
        @clients = @user.clients.all.sort_by{|w| w.name }
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
        respond_to do |format|
            if @client.save
                format.html { redirect_to @client, notice: 'Client was successfully created!' }
            else
                format.html { redirect_to 'new', notice: 'Client was not created!' }
            end
        end
    end

    def show
    end


    def update
        respond_to do |format|
            if @client.update(client_params)
                format.html {redirect_to @client, notice: 'Client was successfully updated.' }
            else
                format.hmtl { render :edit }
            end
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