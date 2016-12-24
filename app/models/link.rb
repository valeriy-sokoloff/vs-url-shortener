class Link < ApplicationRecord

  validates :original_url,
            uniqueness: true,
            presence: true,
            format: { with: /\A#{URI::regexp}\z/ }

  def save(*args)
    super
  rescue ActiveRecord::RecordNotUnique
    valid?
  end
end
