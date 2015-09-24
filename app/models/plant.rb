class Plant < ActiveRecord::Base
	belongs_to :plant_generic_name
	belongs_to :plant_category

	has_many :squares

	accepts_nested_attributes_for :plant_generic_name, :reject_if => :all_blank
	accepts_nested_attributes_for :plant_category, :reject_if => :all_blank
	
	validates :name, :presence => true
end
