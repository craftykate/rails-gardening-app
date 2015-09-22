class Plant < ActiveRecord::Base
	belongs_to :plant_generic_name
	accepts_nested_attributes_for :plant_generic_name, :reject_if => :all_blank
	
	validates :name, 
             presence: true
end
