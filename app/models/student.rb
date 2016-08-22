class Student < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_save { self.name = name.capitalize }

  has_many :clients, dependent: :destroy
  has_many :schools, through: :clients

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
end
