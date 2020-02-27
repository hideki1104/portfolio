class Admin::TrainingsController < ApplicationController

  def new
 	@training = Training.new
  end

  def create
  	@training = Training.new(training_params)
  	url = params[:training][:youtube_url]
  	url = url.last(11)
  	@training.youtube_url = url
  	@training.save
  	redirect_to admin_trainings_path
  end

  def index
    @trainings = Training.all
    @genres = Genre.all
  end

  def edit
  	@training = Training.find(params[:id])
  end

  def update
  	@training = Training.find(params[:id])
  	@training.update(training_params)
  	redirect_to trainings_path
  end

  def destroy
  	training = Training.find(params[:id])
  	training.delete
  	redirect_to admin_trainings_path
  end

  private
    def training_params
        params.require(:training).permit(:genre_id,:training_name,:youtube_url,:description,:number_time)
    end
end