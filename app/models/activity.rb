class Activity < ActiveRecord::Base
  has_and_belongs_to_many :roles
  validates :resource, presence: true
  validates :activity, presence: true

  def to_s
    resource + ' - ' + activity
  end

end
