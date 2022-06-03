class ItemTypesController < ApplicationController
  before_action :set_item_type, only: %i[show edit update destroy]

  def index
    @pagy, @item_types = pagy(ItemType.order(id: :asc), items: per_page)
  end

  def new
    @item_type = ItemType.new
  end

  def create
    @item_type = ItemType.new(item_type_params)

    if @item_type.save
      redirect_to @item_type, notice: 'Item type was successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @item_type.update(item_type_params)
      redirect_to @item_type, notice: 'Item type was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item_type.destroy
    redirect_to item_types_path, notice: 'Item type was successfully destroyed.'
  end

  private

  def set_item_type
    @item_type = ItemType.find(params[:id])
  end

  def item_type_params
    params.require(:item_type).permit(:name)
  end
end
