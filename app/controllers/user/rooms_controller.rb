class User::RoomsController < ApplicationController
	before_action :authenticate_user!
	def create
		@room = Room.create
		@entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
		@entry2 = Entry.create(entry_params)
		redirect_to user_room_path(@room.id)
	end

	def index
		@user = current_user
		@currentEntries = current_user.entries
		myRoomIds = []
		@currentEntries.each do |entry|
			myRoomIds << entry.room.id
		end
        # current_userの他のuser_idを取得する,否定
		@anotherEntries = Entry.where(room_id: myRoomIds).where('user_id != ?',@user.id)
	end

	def show
		@room = Room.find(params[:id])
		if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
			@messages = @room.messages
			@message = Message.new
			@entries = @room.entries
		else
			redirect_to user_path(current_user.id)
		end
	end

	private
	def entry_params
		params.require(:entry).permit(:user_id,:room_id).merge(:room_id => @room.id)
	end
end