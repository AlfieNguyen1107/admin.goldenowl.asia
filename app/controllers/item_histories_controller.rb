class ItemHistoriesController < ApplicationController
  before_action :set_item_history, only: %i[show edit update destroy]
  before_action :set_new_item_history, only: %i[new create]
  before_action :set_item_history_collection, only: %i[index]
  before_action :set_form_selections, only: %i[new create edit]

  def index
    @item_histories = @item_histories.where(item_id: params[:item_id]) if params[:item_id].present?
    @pagy, @item_histories = pagy(@item_histories, items: per_page)
  end

  def new; end

  def create
    if @item_history.save
      redirect_to @item_history, notice: 'Item history was successfully created.'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
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
    authorize(@item_history)
  end

  def set_new_item_history
    @item_history = ItemHistory.new((request.post? && item_history_params) || nil)
    authorize(@item_history)
  end

  def set_item_history_collection
    @item_histories = ItemHistory.includes(:item, :employee)
                                 .order(id: :asc)
    authorize(@item_histories)
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
