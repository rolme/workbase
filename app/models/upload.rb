class Upload < ApplicationRecord
  mount_uploader :image, AvatarUploader
  
  belongs_to :uploadable, :polymorphic => true, optional: true
end
