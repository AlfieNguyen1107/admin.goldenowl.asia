class PositionsController < ApplicationController
  def index
    @ceo = Position.where(name: 'CEO').first
    @group = @ceo.children.arrange
  end
end
