class Experience < ApplicationRecord
  belongs_to :candidate
  
  validates :title, :year, presence: true
end
