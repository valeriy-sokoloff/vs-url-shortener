class Link < ApplicationRecord

  validates :original_url,
            uniqueness: true,
            presence: true

  def save(*args)
    super
  rescue ActiveRecord::RecordNotUnique
    valid?
  end
end
