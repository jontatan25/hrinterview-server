class Candidate < ApplicationRecord
  has_many :experiences, dependent: :destroy
  
  validates :name, presence: true
end
