class Link < ApplicationRecord

  before_validation(on: :create) do
    if attribute_present?("original_url") && URI.parse(self.original_url).scheme.nil?
      self.original_url = "http://#{self.original_url}"
    end
  end

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
