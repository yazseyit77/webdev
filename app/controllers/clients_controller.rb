class ClientsController < ApplicationController
    before_action :set_client, only: [:show, :edit, :update, :destroy]

    def index
        @clients = Client.all
    end

    def new
        @client = Client.new
        @client.projects.build
    end

    def edit
    end


    def create
        @client = Client.new(client_params)
        if @client.save
            redirect_to @client
        else
            @errors = @client.errors.full_messages
            redirect_to 'new'
        end
    end

    def show
    end


    def update
        @client.update(client_params)
        redirect_to @client
    end

    def destroy
        @client.destroy
        redirect_to @clients
    end

    private

    def set_client
        @client = Client.find(params[:id])
    end

    def client_params
        params.require(:client).permit(:name, :email, :password, :phone_number, :address, projects_attributes:[:name, :description, :completed])
    end
end