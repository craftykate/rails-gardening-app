module PlantersHelper
	def display_seeds(num_seeds, square_id, planter_id)
		output = ""
		seed_num = 1
		seed_space = 1
		case num_seeds
		when 1, 17
			link_text = "#{link_to(seed_space, new_seed_path({:square => square_id, :unit => seed_num, :planter => planter_id}))}"
			output += "<div class = 'seeds one seed-1'><span>#{link_text}</span></div>"
			return output
		when 2
			4.times do
				if seed_space == 1 || seed_space == 4
					div_class = "seed-#{seed_num}"
					link_text = "#{link_to(seed_num, new_seed_path({:square => square_id, :unit => seed_num, :planter => planter_id}))}"
					seed_num += 1
				else
					div_class = "none"
					link_text = ""
				end
				output += "<div class = 'seeds four #{div_class}'><span>#{link_text}</span></div>"
				seed_space += 1
			end
			return output
		when 4
			4.times do 
				link_text = "#{link_to(seed_num, new_seed_path({:square => square_id, :unit => seed_num, :planter => planter_id}))}"
				div_class = "seed-#{seed_num}"
				output += "<div class = 'seeds four #{div_class}'><span>#{link_text}</span></div>"
				seed_num += 1
			end
			return output
		when 8
			9.times do
				if seed_space == 5
					div_class = "none"
					link_text = ""
				else
					div_class = "seed-#{seed_num}"
					link_text = "#{link_to(seed_num, new_seed_path({:square => square_id, :unit => seed_num, :planter => planter_id}))}"
					seed_num += 1
				end
				output += "<div class = 'seeds nine #{div_class}'>#{link_text}</div>"
				seed_space += 1
			end
			return output
		when 9
			9.times do
				div_class = "seed-#{seed_num}"
				link_text = "#{link_to(seed_num, new_seed_path({:square => square_id, :unit => seed_num, :planter => planter_id}))}"
				output += "<div class = 'seeds nine #{div_class}'>#{link_text}</div>"
				seed_num += 1
			end
			return output
		when 16
			16.times do
				div_class = "seed-#{seed_num}"
				link_text = "#{link_to(seed_num, new_seed_path({:square => square_id, :unit => seed_num, :planter => planter_id}))}"
				output += "<div class = 'seeds sixteen #{div_class}'>#{link_text}</div>"
				seed_num += 1
			end
			return output
		end
	end
end
