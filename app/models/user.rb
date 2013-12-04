class User < ActiveRecord::Base
  attr_accessible :name
  has_many :tasks, :order => "position"

  before_destroy :ensure_not_referenced_by_any_task

  validates :name, :presence => true

  def ensure_not_referenced_by_any_task
    if tasks.count.zero?
      return true
    else
      errors.add(:base, 'User is in use in a task')
      return false
    end
  end
end
