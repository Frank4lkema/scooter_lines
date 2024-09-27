class ScooterLinesController < ApplicationController
  def index
    @lines = ScooterLine.all

    render json: @lines
  end

  def create
    @line = ScooterLine.create(line_params)

    if @line.valid?
      render json: @line, status: :created
    else
      render json: @line.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @line = ScooterLine.find(params[:id])
    @line.destroy

    head :no_content
  end

  private

  def line_params
    params.permit(:quote)
  end
end
