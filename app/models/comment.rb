class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates_presence_of :content

  scope :public_only, -> { where(public: true) }
end
