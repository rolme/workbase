class Upload < ApplicationRecord
  mount_uploader :image, AvatarUploader
  
  belongs_to :uploadable, :polymorphic => true, optional: true

  def image_name
    image.url.split('/').last
  end

  def self.associate_with_unit(upload_id, unit_id)
    image = where(id: upload_id).last
    if image
      image.update(uploadable_type: 'Unit', uploadable_id: unit_id)
    end
  end
end
