class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit destroy update]
  before_action :set_item_types, only: %i[new edit create]
  before_action :set_employees, only: %i[new edit create]

  def index
    @items = Item.all
    @pagy, @items = pagy(@items.order(id: :ASC), items: per_page)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_path, notice: 'Item was successfully destroyed.' }
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    item_params = params.require(:item).permit(:name, :description, :image, :code, :item_type_id)
    item_params[:employee_id] = (params[:item][:employee_id] if params[:check_status_item] == '1')
    item_params
  end

  def set_item_types
    @item_types = ItemType.all.map { |it| [it.name, it.id] }
  end

  def set_employees
    @employees = Employee.all.order(full_name: :asc).map { |emp| [emp.full_name, emp.id] }
  end
end
