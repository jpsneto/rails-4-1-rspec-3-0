class Role < ActiveRecord::Base
  has_and_belongs_to_many :activities
  validates :name, presence: {strict: true}
  validates_presence_of :activities
end
