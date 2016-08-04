module SoftDeletable
  extend ActiveSupport::Concern

  included do
    scope :active,  -> { where(deleted_at: nil) }
    scope :deleted, -> { where.not(deleted_at: nil) }

    def delete
      update_attribute(:deleted_at, DateTime.now)
    end

    def restore
      update(deleted_at: nil)
    end
  end
end
