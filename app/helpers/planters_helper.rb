module PlantersHelper
	def display_seeds(i)
		case i
		when 1, 17
			"<div class = 'seeds one seed-01'></div>"
		when 2
			"<div class = 'seeds four seed-01'></div>
			<div class = 'seeds four none'></div>
			<div class = 'seeds four seed-02'></div>
			<div class = 'seeds four none'></div>"
		when 4
			"<div class = 'seeds four seed-01'></div>
			<div class = 'seeds four seed-02'></div>
			<div class = 'seeds four seed-03'></div>
			<div class = 'seeds four seed-04'></div>"
		when 8
			"<div class = 'seeds nine seed-01'></div>
			<div class = 'seeds nine seed-02'></div>
			<div class = 'seeds nine seed-03'></div>
			<div class = 'seeds nine seed-04'></div>
			<div class = 'seeds nine none'></div>
			<div class = 'seeds nine seed-05'></div>
			<div class = 'seeds nine seed-06'></div>
			<div class = 'seeds nine seed-07'></div>
			<div class = 'seeds nine seed-08'></div>"
		when 9
			"<div class = 'seeds nine seed-01'></div>
			<div class = 'seeds nine seed-02'></div>
			<div class = 'seeds nine seed-03'></div>
			<div class = 'seeds nine seed-04'></div>
			<div class = 'seeds nine seed-05'></div>
			<div class = 'seeds nine seed-06'></div>
			<div class = 'seeds nine seed-07'></div>
			<div class = 'seeds nine seed-08'></div>
			<div class = 'seeds nine seed-09'></div>"
		when 16
			"<div class = 'seeds sixteen seed-01'></div>
			<div class = 'seeds sixteen seed-02'></div>
			<div class = 'seeds sixteen seed-03'></div>
			<div class = 'seeds sixteen seed-04'></div>
			<div class = 'seeds sixteen seed-05'></div>
			<div class = 'seeds sixteen seed-06'></div>
			<div class = 'seeds sixteen seed-07'></div>
			<div class = 'seeds sixteen seed-08'></div>
			<div class = 'seeds sixteen seed-09'></div>
			<div class = 'seeds sixteen seed-10'></div>
			<div class = 'seeds sixteen seed-11'></div>
			<div class = 'seeds sixteen seed-12'></div>
			<div class = 'seeds sixteen seed-13'></div>
			<div class = 'seeds sixteen seed-14'></div>
			<div class = 'seeds sixteen seed-15'></div>
			<div class = 'seeds sixteen seed-16'></div>"
		end
	end
end
