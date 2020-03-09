class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
    @weight = Weight.last
    @post = current_user.posts.paginate(page: params[:page],per_page: 5).order(created_at: :desc)
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
