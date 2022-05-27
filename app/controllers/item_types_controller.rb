class ItemTypesController < ApplicationController
  before_action :set_item_type, only: %i[show edit destroy update]

  def index
    @item_types = ItemType.all
    @pagy, @item_types = pagy(@item_types.order(id: :ASC), items: per_page)
  end

  def new
    @item_type = ItemType.new
  end

  def create
    @item_type = ItemType.new(item_type_params)

    respond_to do |format|
      if @item_type.save
        format.html { redirect_to @item_type, notice: 'Item type was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @item_type.update(item_type_params)
        format.html { redirect_to @item_type, notice: 'Item type was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item_type.destroy
    respond_to do |format|
      format.html { redirect_to item_types_path, notice: 'Item type was successfully destroyed.' }
    end
  end

  private

  def set_item_type
    @item_type = ItemType.find(params[:id])
  end

  def item_type_params
    params.require(:item_type).permit(:name)
  end
end
