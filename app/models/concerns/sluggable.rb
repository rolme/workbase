module Sluggable
  extend ActiveSupport::Concern

  class_methods do
    def find(input)
      find_by(slug: input)
    end
  end

  included do
    validates :slug, uniqueness: true

    before_create :generate_slug

    def generate_slug
      self.slug = SecureRandom.urlsafe_base64 if slug.nil?
    end

    def to_param
      slug
    end
  end
end
