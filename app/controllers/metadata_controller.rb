class MetadataController < ApplicationController

  before_action :metadatum, only: [:edit, :update, :destroy, :restore]
  before_action :metadata, only: [:index, :update, :destroy, :restore]

  # GET /settings/metadata
  def index
  end

  # GET /settings/metadata/new
  def new
    @metadatum = Metadatum.new
  end

  # POST /settings/metadata
  def create
    @metadatum = current_company.metadata.new(metadatum_params)
    if @metadatum.save
      @metadata = metadata
      render :index
    else
      flash[:danger] = @metadatum.errors.full_messages
      render 'new'
    end
  end

  # GET /settings/metadata/:slug/edit
  def edit
  end

  # PATCH /settings/metadata/:slug
  def update
    if @metadatum.update(metadatum_params)
      @metadata = metadata
      render :index
    else
      flash[:danger] = @metadatum.errors.full_messages
      render 'edit'
    end
  end

  # DELETE /settings/metadata/:slug
  def destroy
    if @metadatum.deleted?
      @metadatum.destroy
    else
      @metadatum.delete
    end
    render :index
  end

  # GET /settings/metadata/:slug/restore
  def restore
    if @metadatum.deleted?
      @metadatum.restore
    end
    render :index
  end

  private

  def metadatum_params
    params.require(:metadatum)
      .permit(:metadatum_type_id,
        :name,
        :default_value => []
        )
  end

  def metadatum
    @metadatum = Metadatum.find_by(slug: params[:slug])
  end

  def metadata
    @metadata = current_company.metadata
  end
end