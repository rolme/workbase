class Comment < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates_presence_of :content
end
