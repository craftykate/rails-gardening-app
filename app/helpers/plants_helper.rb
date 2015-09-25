module PlantsHelper
	def how_many(p)
		if p.squares.empty?
			how_many = ""
		else
			planted = 0
			scheduled = 0
			p.squares.each do |square|
				square.seeds.each do |seed|
					if seed.planted
						planted += 1
					else
						scheduled += 1
					end
				end
			end
			if planted != 0
				planted = planted.to_s + "❀"
			else
				planted = ""
			end
			if scheduled != 0
				scheduled = scheduled.to_s + "◷"
			else
				scheduled = ""
			end
			how_many = "#{scheduled}#{planted}"
		end
		return how_many
	end
end
