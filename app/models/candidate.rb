class Candidate < ApplicationRecord
  belongs_to :user
  has_many :experiences, dependent: :destroy
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, uniqueness: true
end
