class PlantsController < ApplicationController

    def create
        plant = Plant.create!(plant_params)
        render json: plant, status: :created
    end

    def index
        plants = Plant.all
        render json: plants
    end

    def show
        plant = Plant.find(params[:id])
        plant ? (render json: plant, status: :ok) : (render json: { error: "Plant not found" }, status: :not_found)
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end
