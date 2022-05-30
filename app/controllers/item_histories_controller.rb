class ItemHistoriesController < ApplicationController
  before_action :set_item_history, only: %i[show edit destroy update]
  before_action :set_items, only: %i[new edit create]
  before_action :set_employees, only: %i[new edit create]

  def index
    @item_histories = ItemHistory.all
    @pagy, @item_histories = pagy(@item_histories.order(id: :ASC), items: per_page)
  end

  def new
    @item_history = ItemHistory.new
  end

  def create
    @item_history = ItemHistory.new(item_history_params)
    respond_to do |format|
      if @item_history.save
        format.html { redirect_to @item_history, notice: 'Item history was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @item_history.update(item_history_params)
        format.html { redirect_to @item_history, notice: 'Item history was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item_history.destroy
    respond_to do |format|
      format.html { redirect_to item_histories_path, notice: 'Item history was successfully destroyed.' }
    end
  end

  private

  def set_item_history
    @item_history = ItemHistory.find(params[:id])
  end

  def item_history_params
    params.require(:item_history).permit(:item_id, :employee_id, :start_date, :end_date, :description)
  end

  def set_items
    item_ids = ItemHistory.where('end_date >= ? ', Date.current).pluck(:item_id) + ItemHistory.where(end_date: nil).pluck(:item_id)
    item_ids -= [@item_history.item_id] if @item_history.present?
    @items = Item.where.not(id: item_ids).map { |it| [it.name, it.id] }
  end

  def set_employees
    @employees = Employee.all.order(full_name: :asc).map { |emp| [emp.full_name, emp.id] }
  end
end
