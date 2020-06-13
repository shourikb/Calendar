class MeetingsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@meeting = Meeting.all
	end

	def new
		@meeting = current_user.meetings.build
	end

	def create
		meeting = current_user.meetings.build(meeting_params)
		if meeting.save
			redirect_to meetings_path
		else 
			flash[:errors] = meeting.errors.full_messages
			redirect_back(fallback_location:"/")
		end
	end

	def moreinfo
		@meeting = Meeting.find(params[:id])
	end

	def edit
		@meeting = Meeting.find(params[:id])
	end

	def update
		meeting = Meeting.find(params[:id])
		if meeting.update(meeting_params)
			redirect_to meetings_path
		else 
			flash[:errors] = meeting.errors.full_messages
			redirect_back(fallback_location:"/")
		end
	end

	def delete 
		meeting = Meeting.find(params[:id])
		meeting.destroy
		redirect_to meetings_path
	end


private 
	def meeting_params
	 	params.require(:meeting).permit(:name, :date, :start_time, :end_time, :description)
	end
end
