class WorkingGroup < ActiveRecord::Base
  has_many :tasks
  has_many :volunteers, through: :tasks
  belongs_to :circle
end
