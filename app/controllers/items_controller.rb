class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  before_action :set_new_item, only: %i[new create]
  before_action :set_item_collection, only: %i[index]
  before_action :set_form_selections, only: %i[new create edit]

  def index
    @pagy, @items = pagy(@items, items: per_page)
  end

  def new; end

  def create
    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'Item was successfully destroyed.'
  end

  private

  def set_item
    @item = Item.find(params[:id])
    authorize(@item)
  end

  def set_new_item
    @item = Item.new((request.post? && item_params) || nil)
    authorize(@item)
  end

  def set_item_collection
    @items = Item.order(id: :asc)
    authorize(@items)
  end

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :image,
      :code,
      :item_type_id
    )
  end

  def set_form_selections
    @item_types = ItemType.all.map { |it| [it.name, it.id] }
    @employees = Employee.order(full_name: :asc).map { |emp| [emp.full_name, emp.id] }
  end
end
