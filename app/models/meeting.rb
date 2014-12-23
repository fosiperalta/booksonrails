class Meeting < ActiveRecord::Base
	has_many :assistances
	#Evitamos el error al intentar hacer mass assignment
	attr_accessible :title
	attr_accessible :date
	attr_accessible :country
	attr_accessible :city
	attr_accessible :direction
	attr_accessible :creator


	#Validamos que existan una serie de atributos
	validates :title, :presence => true

	#Que sean unicos
	validates :title, uniqueness: true

end