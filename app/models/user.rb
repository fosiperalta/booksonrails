class User < ActiveRecord::Base
  has_many :exemplars
  has_many :assistances
	#Evitamos el error al intentar hacer mass assignment
  attr_accessible :username
  attr_accessible :email
  attr_accessible :name
  attr_accessible :surname
  attr_accessible :password
  attr_accessible :birth_date

	#Validamos que existan una serie de atributos
	validates :username, :presence => true
	validates :email, :presence => true
	validates :password, :presence => true

#  validates :username, uniqueness: true
#  validates :email, uniqueness: true

end