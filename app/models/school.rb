class School < ActiveRecord::Base
  has_many :clients, dependent: :destroy
  has_many :students, through: :clients

  validates :name, presence: true
end
