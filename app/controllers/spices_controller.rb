class SpicesController < ApplicationController

    def index
        spices= Spice.all
        render json: spices
    end

    def create
        spices = Spice.create(spices_params)
    render json: spices, status: :created
    end

    def update
        spices= find_spices
        spices.update(spices_params)
        render json: spices
    end

    def destroy
        spices= find_spices
        spices.destroy
        head :no_content
    end
    private
    def find_spices
        Spice.find_by(id: params[:id])
    end

    def spices_params
        params.permit(:title, :image, :description,:notes,:rating)
    end
end
