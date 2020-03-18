class UsersController < ApplicationController
  before_action :authenticate_user!


  # フォロー、フォロワー一覧ページ
  def index
  end

  def show
  	@user = User.find(params[:id])
    @weight = Weight.last
    @post = current_user.posts.paginate(page: params[:page],per_page: 5).order(created_at: :desc)
    # DM機能
    @currentEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user: @user.id)
    if @user.id == current_user.id

    else
      @currentEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom

      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to user_path(current_user.id)
  end

  private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction,:age,:sex,:age,:height,:registar_weight)
    end
end
