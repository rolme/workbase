class UnitCategoriesController < ApplicationController

  # GET /inventory/unit_categories
  def index
    @unit_categories = unit_categories
  end

  # GET /inventory/unit_categories/:slug
  def show
    @unit_category = unit_category
  end

  # GET /inventory/unit_categories/new
  def new
    @unit_category = UnitCategory.new
  end

  # POST /inventory/unit_categories
  def create
    @unit_category = UnitCategory.new(unit_category_params.merge(company_id: current_user.company_id))
    if @unit_category.save
      redirect_to @unit_category
    else
      flash[:error] = @unit_category.errors.full_messages
      render 'new'
    end
  end

  # GET /inventory/unit_categories/:slug/edit
  def edit
    @unit_category = unit_category
  end

  # PATCH /inventory/unit_categories/:slug
  def update
    @unit_category = unit_category
    if @unit.update(unit_category_params)
      redirect_to @unit
    else
      flash[:error] = @unit_category.errors.full_messages
      render 'edit'
    end
  end

private

  def unit_categories
    UnitCategory.with_company_id(current_user.company_id)
  end

  def unit_category
    unit_categories.find_by slug: params[:slug]
  end

  def unit_category_params
    params.require(:unit_category).permit(:label, :position)
  end
end
