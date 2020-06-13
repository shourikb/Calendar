class Meeting < ApplicationRecord
	
	validates :name, :date, :start_time, :end_time, :user_id, presence: true
	belongs_to :user
end
