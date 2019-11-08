class ClientsController < ApplicationController
    before_action :set_client, only: [:show, :edit, :update, :destroy]

    def index
        @clients = Client.all
    end

    def new
        @client = Client.new
        byebug
        @client.projects.build
    end

    def edit
    end


    def create
        @client = Client.new(client_params)
        respond_to do |format|
            if @client.save
                format.html { redirect_to @client, notice: 'Client was successfully created!' }
            else
                # @errors = @client.errors.full_messages
                format.html { redirect_to 'new'}
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