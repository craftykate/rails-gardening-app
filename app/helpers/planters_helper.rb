module PlantersHelper
	def display_seeds(num_seeds)
		output = ""
		seed_num = 1
		seed_space = 1
		case num_seeds
		when 1, 17
			output += "<div class = 'seeds one seed-1'></div>"
			return output
		when 2
			4.times do
				if seed_space == 1 || seed_space == 4
					div_class = "seed-#{seed_num}"
					seed_num += 1
				else
					div_class = "none"
				end
				output += "<div class = 'seeds four #{div_class}'></div>"
				seed_space += 1
			end
			return output
		when 4
			4.times do 
				div_class = "seed-#{seed_num}"
				output += "<div class = 'seeds four #{div_class}'></div>"
				seed_num += 1
			end
			return output
		when 8
			9.times do
				if seed_space == 5
					div_class = "none"
				else
					div_class = "seed-#{seed_num}"
					seed_num += 1
				end
				output += "<div class = 'seeds nine #{div_class}'></div>"
				seed_space += 1
			end
			return output
		when 9
			9.times do
				div_class = "seed-#{seed_num}"
				output += "<div class = 'seeds nine #{div_class}'></div>"
				seed_num += 1
			end
			return output
		when 16
			16.times do
				div_class = "seed-#{seed_num}"
				output += "<div class = 'seeds sixteen #{div_class}'></div>"
				seed_num += 1
			end
			return output
		end
	end
end
