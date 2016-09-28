class Header < ApplicationRecord
  belongs_to :website
  
  HTML_TAGS = %w(h1 h2 h3)
  
  validates :tag, :text, presence: true
  validates :tag, inclusion: HTML_TAGS
end
