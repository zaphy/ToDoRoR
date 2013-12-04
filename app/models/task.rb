class Task < ActiveRecord::Base
  attr_accessible :author, :category_id, :user_id, :deadline, :detailed_text, :effort_estimation, :short_text
  belongs_to :category
  belongs_to :user

  acts_as_list scope: :user

  validates :author, :presence => true
  validates :category, :presence => true
  validates :user, :presence => true
  validates :deadline, :presence => true
  validates :effort_estimation, :presence => true
  validates :short_text, :presence => true

end
