class Plant < ActiveRecord::Base
	validates :name, 
             presence: true
end
