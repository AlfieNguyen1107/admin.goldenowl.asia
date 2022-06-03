class ItemHistoriesController < ApplicationController
  before_action :set_item_history, only: %i[show edit update destroy]
  before_action :set_form_selections, only: %i[new create edit]

  def index
    @item_histories = ItemHistory.includes(:item, :employee).order(id: :asc)
    @item_histories = @item_histories.where(item_id: params[:item_id]) if params[:item_id].present?
    @pagy, @item_histories = pagy(@item_histories, items: per_page)
  end

  def new
    @item_history = ItemHistory.new
  end

  def create
    @item_history = ItemHistory.new(item_history_params)

    if @item_history.save
      redirect_to @item_history, notice: 'Item history was successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    authorize @item_history

    if @item_history.update(item_history_params)
      redirect_to @item_history, notice: 'Item history was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @item_history.destroy
    redirect_to item_histories_path, notice: 'Item history was successfully destroyed.'
  end

  private

  def set_item_history
    @item_history = ItemHistory.find(params[:id])
  end

  def item_history_params
    params.require(:item_history).permit(
      :item_id,
      :employee_id,
      :start_date,
      :end_date,
      :description,
      :status
    )
  end

  def set_form_selections
    @items = Item.available.or(Item.where(id: @item_history&.item_id)).map { |it| [it.name, it.id] }
    @employees = Employee.order(full_name: :asc).map { |emp| [emp.full_name, emp.id] }
  end
end
