module PlantersHelper
	def display_seeds(num_seeds, square_id, planter_id)
		output = ""
		seed_num = 1
		seed_space = 1
		@square = Square.find(square_id)
		case num_seeds
		when 1, 17
			div_class = "seed-#{seed_num}"
			link_text = generate_link_text(seed_num, square_id, planter_id)
			output += generate_div("one", div_class, link_text)
			return output
		when 2
			4.times do
				if seed_space == 1 || seed_space == 4
					div_class = "seed-#{seed_num}"
					link_text = generate_link_text(seed_num, square_id, planter_id)
					seed_num += 1
				else
					div_class = "none"
					link_text = ""
				end
				output += generate_div("four", div_class, link_text)
				seed_space += 1
			end
			return output
		when 4
			4.times do 
				div_class = "seed-#{seed_num}"
				link_text = generate_link_text(seed_num, square_id, planter_id)
				output += generate_div("four", div_class, link_text)
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
					link_text = generate_link_text(seed_num, square_id, planter_id)
					seed_num += 1
				end
				output += generate_div("nine", div_class, link_text)
				seed_space += 1
			end
			return output
		when 9
			9.times do
				div_class = "seed-#{seed_num}"
				link_text = generate_link_text(seed_num, square_id, planter_id)
				output += generate_div("nine", div_class, link_text)
				seed_num += 1
			end
			return output
		when 16
			16.times do
				div_class = "seed-#{seed_num}"
				link_text = generate_link_text(seed_num, square_id, planter_id)
				output += generate_div("sixteen", div_class, link_text)
				seed_num += 1
			end
			return output
		end
	end

	def generate_link_text(seed_num, square_id, planter_id)
		if @square.seeds.where(square_space: seed_num).exists?
			date_text = @square.seeds.where(square_space: seed_num).first.plant_date.strftime("%b %d '%y")
			link_text = "#{link_to(date_text, edit_seed_path(@square.seeds.where(square_space: seed_num).first, {:square_id => square_id, :square_space => seed_num, :planter_id => planter_id}), :class=>"planted")}"
		else
			link_text = "#{link_to("", new_seed_path({:square_id => square_id, :square_space => seed_num, :planter_id => planter_id}))}"
		end
		return link_text
	end

	def generate_div(num_seeds, div_class, link_text)
		return "<div class = 'seeds #{num_seeds} #{div_class}'>#{link_text}</div>"
	end
end
