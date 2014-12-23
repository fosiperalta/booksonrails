class Session < ActiveRecord::Base

#Evitamos el error al intentar hacer mass assignment
attr_accessible :username
attr_accessible :login_date

end