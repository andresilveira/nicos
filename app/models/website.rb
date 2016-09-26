class Website < ApplicationRecord
  validates :url, presence: true
  validate  :url_valid?

  private

  def url_valid?
    unless Validators::Url.valid?(url)
      errors.add(:url, 'is not a valid url')
    end
  end
end
