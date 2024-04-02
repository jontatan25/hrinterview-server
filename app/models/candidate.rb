class Candidate < ApplicationRecord
  belongs_to :user
  has_many :experiences, dependent: :destroy
  
  validates :name, presence: true
end
