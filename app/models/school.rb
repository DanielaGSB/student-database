class School < ActiveRecord::Base
  has_many :clients
  has_many :students, through: :clients

  validates :name, presence: true
end
