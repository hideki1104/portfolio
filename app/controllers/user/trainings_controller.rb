class User::TrainingsController < ApplicationController

  def index
    @genres = Genre.where(class_status: '0')
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @trainings = @genre.trainings.all
    else
      @trainings = Training.all
    end

  end

  def show
  	@training = Training.find(params[:id])
    @conduct_training = ConductTraining.new
  end


  private
    def training_params
        params.require(:training).permit(:genre_id,:training_name,:youtube_url,:description,:number_time)
    end
end