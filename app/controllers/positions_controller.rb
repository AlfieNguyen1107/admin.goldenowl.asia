class PositionsController < ApplicationController
  before_action :set_position, only: %i[show edit destroy update]

  def index
    @ceo = Position.where(name: 'CEO').first
    @group = @ceo.children.arrange
  end

  def show; end

  def edit; end

  def create
    @position = Position.new(position_params)
    if @position.save
      redirect_to positions_path, notice: 'Position was successfully created'
    else
      redirect_to positions_path, notice: 'Position was unsuccessfully created'
    end
  end

  def new
    @position = Position.new
  end

  def update
    if @position.update(position_params)
      redirect_to position_path, notice: 'Position was successfully updated'
    else
      redirect_to position_path, notice: 'Position was unsuccessfully updated'
    end
  end

  def destroy
    if @position.destroy
      redirect_to positions_path, notice: 'Position was successfully destroyed'
    else
      redirect_to positions_path, notice: 'Position was unsuccessfully destroyed'
    end
  end

  private

  def set_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:ancestry, :name)
  end
end
