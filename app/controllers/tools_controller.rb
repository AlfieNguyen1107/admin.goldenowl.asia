class ToolsController < ApplicationController
  before_action :set_tool, only: %i[show edit update destroy]

  def index
    @tool_all = Tool.all
    if params[:name].present?
      @name = params[:name]
      @tools = Tool.filter_name_tool(@name)
    else
      @tools = Tool.all
    end
    @pagy, @tools = pagy(@tools.order(id: :ASC), item: per_page)
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      redirect_to tools_path, notice: "Tool was successfully created"
    else
        redirect_to tools_path, notice: "Tool was unsuccessfully created"
    end
  end

  def show; end

  def edit; end

  def new
    @tool = Tool.new
  end

  def update
    if @tool.update(tool_params)
      redirect_to tool_path, notice: "Tool was successfully updated"
    else
        redirect_to tool_path, notice: "Tool was unsuccessfully updated"
    end
  end

  def destroy
    if @tool.destroy
      redirect_to tools_path, notice: "Tool was successfully destroyed"
    else
      redirect_to tools_path, notice: "Tool was unsuccessfully destroyed"
    end
  end

  private

  def set_tool
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :skill_category_id)
  end
end
