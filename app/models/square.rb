class Square < ActiveRecord::Base
	belongs_to :planter
	belongs_to :plant

	has_many :seeds
end
