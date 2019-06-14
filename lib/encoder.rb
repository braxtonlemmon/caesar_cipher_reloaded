class Encoder
	attr_accessor :original, :encoded, :shift
	
	def initialize(params)
		@original = params["phrase"]
		@shift = params["shift"].to_i
		@encoded = encode unless @original.nil?
	end

	def encode
    code = []
		key = @shift > 26 || @shift < -26 ? @shift % 26 : @shift  
		
    phrase = @original.split(//).each do |character|
			id = character.ord
			if id.between?(97,122) 
				if id + key > 122 
					code << (id - (26 - key)).chr
				elsif id + key < 97 
					code << (id + 26 + key).chr
				else
					code << (id + key).chr
				end
			elsif id.between?(65,90)
				if id + key > 90
					code << (id - (26 - key)).chr
				elsif id + key < 65
					code << (id + @shift + 26).chr
				else 
					code << (id + key).chr
				end
			else
				code << character
			end
    end
		code.join('')
	end
end

