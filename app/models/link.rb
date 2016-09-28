class Link < ApplicationRecord
  belongs_to :website
  
  validates :href, :text, presence: true
end
