class PositionsController < ApplicationController
  before_action :set_position, only: %i[show edit destroy update]
  before_action :set_new_position, only: %i[new create]

  def index
    @ceo = Position.where(name: 'CEO').first
    @group = @ceo.children.arrange
  end

  def show; end

  def edit; end

  def create
    if @position.save
      redirect_to positions_path, notice: 'Position was successfully created'
    else
      redirect_to positions_path, notice: 'Position was unsuccessfully created'
    end
  end

  def new; end

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
    authorize(@position)
  end

  def position_params
    params.require(:position).permit(:ancestry, :name)
  end

  def set_new_position
    @position = Position.new((request.post? && position_params) || nil)
    authorize(@position)
  end
end
