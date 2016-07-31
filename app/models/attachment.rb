class Attachment < ApplicationRecord
  mount_uploader :asset, AssetUploader

  belongs_to :project

  def image?
    /^image/ === asset.content_type
  end

  def video?
    /mov|mp4$/ === asset.content_type
  end
end
