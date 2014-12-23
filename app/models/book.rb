class Book < ActiveRecord::Base
	has_many :exemplars
	#Evitamos el error al intentar hacer mass assignment
	attr_accessible :title
	attr_accessible :author
	attr_accessible :isbn10
	attr_accessible :isbn13
	attr_accessible :publisher
	attr_accessible :language
	attr_accessible :summary

	#Validamos que existan una serie de atributos
	validates :title, :presence => true
	validates :author, :presence => true
	validates :isbn10, :presence => true
	validates :isbn13, :presence => true

	#Que sean unicos
	validates :isbn10, uniqueness: true
	validates :isbn13, uniqueness: true

	#Que tengan la longitud adecuada (con guiones)
	validates :isbn10, length: { is: 13 }
	validates :isbn13, length: { is: 17 }

	validate :isbn10Correct

	def isbn10Correct
    	#Separamos el string en un array de caracteres
		arrayChars = isbn10.split("")
		#Comprobamos que los caracteres adecuados son dígitos
    result = true
		if (arrayChars[0] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[1] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[3] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[4] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[5] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[6] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[8] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[9] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[10] =~ /[0-9]/).nil?
        result=false
    end
    if ((arrayChars[12] =~ /[0-9]/).nil? and (arrayChars[12] !="X"))
        result=false
    end
		#Comprobamos que los caracteres adecuados son guiones
		result = ((arrayChars[2] == "-") and result)
		result = ((arrayChars[7] == "-") and result)
		result = ((arrayChars[11] == "-") and result)

		if (result == false)
			errors[:base] << "[ISBN10] Incorrect format, should be something like XX-XXXX-XXX-X" 
		end

		if (result == true)
			#Realizamos el cálculo del dígito de control modulo 11
			control = 0
			control = (arrayChars[0].to_i*1) + control
			control = (arrayChars[1].to_i*2) + control
			control = (arrayChars[3].to_i*3) + control
			control = (arrayChars[4].to_i*4) + control
			control = (arrayChars[5].to_i*5) + control
			control = (arrayChars[6].to_i*6) + control
			control = (arrayChars[8].to_i*7) + control
			control = (arrayChars[9].to_i*8) + control
			control = (arrayChars[10].to_i*9) + control

			control = control%11
			final = arrayChars[12]
			if (arrayChars[12] == "X")
				final = 10
			end
			result = (control.to_s == final.to_s)
			if (result == false)
				errors[:base] << "[ISBN10] The control digit is incorrect" 
			end
		end
	end

	def isbn13Correct
		#Separamos el string en un array de caracteres
		arrayChars = isbn13.split("")
		#Comprobamos que los caracteres adecuados son dígitos
		result = true
		if (arrayChars[0] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[1] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[2] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[4] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[6] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[7] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[8] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[9] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[11] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[12] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[13] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[14] =~ /[0-9]/).nil?
        result=false
    end
    if (arrayChars[16] =~ /[0-9]/).nil?
        result=false
    end
    
		#Comprobamos que los caracteres adecuados son guiones
		result = ((arrayChars[3] == "-") and result)
		result = ((arrayChars[5] == "-") and result)
		result = ((arrayChars[10] == "-") and result)
		result = ((arrayChars[15] == "-") and result)


		if (result == false)
			errors[:base] << "[ISBN13] Incorrect format, should be something like YYY-Y-YYYY-YYYY-Y"
		end

		if (result == true)
			#Realizamos el cálculo del dígito de control modulo 11
			control = 0
			control = (arrayChars[0].to_i*1) + control
			control = (arrayChars[1].to_i*3) + control
			control = (arrayChars[2].to_i*1) + control
			control = (arrayChars[4].to_i*3) + control
			control = (arrayChars[6].to_i*1) + control
			control = (arrayChars[7].to_i*3) + control
			control = (arrayChars[8].to_i*1) + control
			control = (arrayChars[9].to_i*3) + control
			control = (arrayChars[11].to_i*1) + control
			control = (arrayChars[12].to_i*3) + control
			control = (arrayChars[13].to_i*1) + control
			control = (arrayChars[14].to_i*3) + control

			control = control%10
			control = 10 -control
			result = (control.to_s == arrayChars[16])
			if (result == false)
				errors[:base] << "[ISBN13] The control digit is incorrect" 
			end
		end
	end
end
