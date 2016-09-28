class Website < ApplicationRecord
  validates :url, presence: true
  validate  :url_valid?

  has_many :links, dependent: :destroy

  private

  def url_valid?
    errors.add(:url, 'is not a valid url') unless Validators::Url.valid?(url)
  end
end
