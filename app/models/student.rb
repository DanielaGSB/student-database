class Student < ActiveRecord::Base
  has_many :clients
  has_many :schools, through: :clients

  validates :name, :email, presence: true
end
