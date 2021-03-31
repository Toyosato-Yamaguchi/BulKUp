class ChartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chart, only: [:show, :edit, :update, :dastroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def new
    @chart = Chart.new
  end

  def create
    @chart = Chart.new(chart_params)
    if @chart.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def show
    nutrient_calculation
  end

  def edit
  end

  def update
    if @chart.update(chart_params)
      redirect_to user_path(current_user.id)
    else
      reder :edit
    end
  end

  def destroy
    @chart.destroy
    redirect_to user_path(current_user.id)
  end


  private

  def chart_params
    params.require(:chart).permit(:chart_date, :weight, :calorie, :protein, :lipid, :carbohydorate, :vitamin_B1, :vitamin_B2, :vitamin_B6, :vitamin_C, :vitamin_D ).merge(user_id: current_user.id)
  end
  
  def set_chart
    @chart = Chart.find(params[:id])
  end

  def move_to_index
    unless current_user == @chart.user
      redirect_to root_path
     end
  end

  def nutrient_calculation
    basic_protein = @chart.weight * 2
    @protein = (@chart.protein.to_f / basic_protein) * 100
    gon.protein = @protein

    basic_fat = (@chart.calorie.to_f * 0.2) / 9
    @fat = (@chart.lipid.to_f / basic_fat) * 100
    gon.fat = @fat

    basic_carbohydorate = (@chart.calorie.to_f - (basic_protein * 4) - (@chart.calorie * 0.2)) / 4
    @carbohydorate = (@chart.carbohydorate.to_f / basic_carbohydorate) * 100
    gon.carbohydorate = @carbohydorate

    @vitamin_B1 = (@chart.vitamin_B1.to_f / 1.4) * 100
    @vitamin_B2 = (@chart.vitamin_B2.to_f / 1.6) * 100
    @vitamin_B6 = (@chart.vitamin_B6.to_f / 1.4) * 100
    @vitamin_C = @chart.vitamin_C.to_f
    @vitamin_D = (@chart.vitamin_D.to_f / 5.5) * 100
    gon.vitamin_B1 = @vitamin_B1
    gon.vitamin_B2 = @vitamin_B2
    gon.vitamin_B6 = @vitamin_B6
    gon.vitamin_C  = @vitamin_C
    gon.vitamin_D  = @vitamin_D
  end
end
