class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit destroy update]
  before_action :set_form_selections, only: %i[new edit create]

  def index
    @pagy, @items = pagy(Item.order(id: :asc), items: per_page)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
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
