class ItemTypesController < ApplicationController
  before_action :set_item_type, only: %i[show edit update destroy]
  before_action :set_new_item_type, only: %i[new create]
  before_action :set_item_type_collection, only: %i[index]

  def index
    @pagy, @item_types = pagy(@item_types, items: per_page)
  end

  def new; end

  def create
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
    authorize(@item_type)
  end

  def set_new_item_type
    @item_type = ItemType.new((request.post? && item_type_params) || nil)
    authorize(@item_type)
  end

  def set_item_type_collection
    @item_types = ItemType.order(id: :asc)
    authorize(@item_types)
  end

  def item_type_params
    params.require(:item_type).permit(:name)
  end
end
