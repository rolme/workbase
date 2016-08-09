class UnitCategoriesController < ApplicationController

  # GET /inventory/unit_categories
  def index
    @unit_categories = unit_categories
  end

  # GET /inventory/unit_categories/new
  def new
    @unit_category = UnitCategory.new
  end

  # POST /inventory/unit_categories
  def create
    @unit_category = UnitCategory.new(unit_category_params.merge(company_id: current_user.company_id))
    if @unit_category.save
      @unit_categories = unit_categories
      render :index
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
    if @unit_category.update(unit_category_params)
      @unit_categories = unit_categories
      render :index
    else
      flash[:error] = @unit_category.errors.full_messages
      render 'edit'
    end
  end

  # DELETE /inventory/unit_categories/:slug
  def destroy
    if unit_category.deleted?
      unit_category.destroy
    else
      unit_category.delete
    end
    @unit_categories = unit_categories
    render :index
  end

  # GET /inventory/unit_categories/:slug/restore
  def restore
    if unit_category.deleted?
      unit_category.restore
    end
    @unit_categories = unit_categories
    render :index
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
