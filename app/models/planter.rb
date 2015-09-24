class Planter < ActiveRecord::Base
	has_many :squares, dependent: :destroy

	validates :name, :presence => true
	validates :length, :presence => true
	validates :width, :presence => true
end
