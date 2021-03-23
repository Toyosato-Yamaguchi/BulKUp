class ChartsController < ApplicationController

  def index
    nutrient_calculation
  end

  def new
    @chart = Chart.new
  end

  def create
    @chart = Chart.new(chart_params)
    if @chart.save
      redirect_to charts_path
    else
      render :new
    end
  end

  private

  def chart_params
    params.require(:chart).permit(:calorie, :protein, :lipid, :carbohydorate, :vitamin_B1, :vitamin_B2, :vitamin_B6, :vitamin_C, :vitamin_D ).merge(user_id: current_user.id)
  end

  def nutrient_calculation
    @charts = Chart.find_by user_id: current_user
    basic_protein = @charts.user.body_weight * 2
    @protein = (@charts.protein.to_f / basic_protein) * 100
    gon.protein = @protein

    basic_fat = (@charts.calorie.to_f * 0.2) / 9
    @fat = (@charts.lipid.to_f / basic_fat) * 100
    gon.fat = @fat

    basic_carbohydorate = (@charts.calorie.to_f - (basic_protein * 4) - (@charts.calorie * 0.2)) / 4
    @carbohydorate = (@charts.carbohydorate.to_f / basic_carbohydorate) * 100
    gon.carbohydorate = @carbohydorate

    @vitamin_B1 = (@charts.vitamin_B1.to_f / 1.4) * 100
    @vitamin_B2 = (@charts.vitamin_B2.to_f / 1.6) * 100
    @vitamin_B6 = (@charts.vitamin_B6.to_f / 1.4) * 100
    @vitamin_C = @charts.vitamin_C.to_f
    @vitamin_D = (@charts.vitamin_D.to_f / 5.5) * 100
    gon.vitamin_B1 = @vitamin_B1
    gon.vitamin_B2 = @vitamin_B2
    gon.vitamin_B6 = @vitamin_B6
    gon.vitamin_C  = @vitamin_C
    gon.vitamin_D  = @vitamin_D
  end
end
