class Player < ApplicationRecord
	#Associtations
	has_many :scores, dependent: :destroy

	#Validations
	validates :f_name, :l_name, :contact, :join_date, presence: true
	validates :join_date, presence: true, on: :create

	#To merge f_name & l_name
	def full_name
		"#{f_name} #{l_name}"		
	end
end
