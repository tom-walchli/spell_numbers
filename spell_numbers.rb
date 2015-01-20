class Spell_Out
	def initialize(number)
		if(number.to_s.to_i != number.to_i)
			puts "This program only supports numbers!"
			return
		end
		@nbrString 	= ""
		@ciphers    = [:zero,:one,:two,:three,:four,:five,:six,:seven,:eight,:nine]
		@decimals   = [:and,:ten,:twenty,:thirty,:fourty,:fifty,:sixty,:seventy,:eighty,:ninety]
		@exceptions = {"10"=> :ten, "11"=>:eleven ,"12"=>:twelve,"13"=>:thirteen,
						"14"=>:fourteen,"15"=>:fifteen,"16"=>:sixteen,
						"17"=>:seventeen,"18"=>:eighteen,"19"=>:nineteen}

		@number  	 = number
		hasDecimals  = (number.index('.') != nil)
		@beforePoint = number.split(".")[0].split("")

		while @beforePoint.length > 0
			digit = @beforePoint.shift.to_i
			if @beforePoint.length+1 == 2 && digit == 1
				key = "#{digit.to_s}#{@beforePoint.last}"
				@nbrString += "#{@exceptions[key]} "
				break
			else
				@nbrString += sayNumber(digit, @beforePoint.length+1,:before)
			end
		end

		if hasDecimals
			@nbrString += "point "
			@afterPoint  = number.split(".")[1].split("")
			while @afterPoint.length > 0
				@nbrString += sayNumber(@afterPoint.shift.to_i, 1, :after)
			end
		end
		puts @nbrString
	end

	def sayNumber(digit, pos, befOrAft=:before)
		str = ""
		cipher = @ciphers[digit]
		val = cipher.to_s + " "

		if befOrAft==:before && cipher == :zero
			return "and "
		end

		case pos
		when 4
			str += val
			str += "thousand "
		when 3
			str += val
			str += "hundred "
		when 2
			str += "#{@decimals[digit]} "
		when 1
			str += val
		end
		return str
	end
end


print "\nType a Number: "
Spell_Out.new(gets.chomp)
