class Assistance < ActiveRecord::Base
  belongs_to :user
  belongs_to :meeting

  validates :user_id, :presence => true
  validates :meeting_id, :presence => true

  validates_uniqueness_of :user_id, scope: :meeting_id

  attr_accessible :user_id
  attr_accessible :meeting_id
  attr_accessible :books

  serialize :books
end