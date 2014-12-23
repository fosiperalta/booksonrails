class Exemplar < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user_id, :presence => true
  validates :book_id, :presence => true

  attr_accessible :user_id
  attr_accessible :book_id
  attr_accessible :shareable
end