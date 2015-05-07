class User < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :roles
  has_many :activities, through: :roles

  validates :email, presence: true, uniqueness: true
end
