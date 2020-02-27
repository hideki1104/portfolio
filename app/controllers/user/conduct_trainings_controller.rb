class User::ConductTrainingsController < ApplicationController
  def index
  	@conduct_trainings = current_user.conduct_trainings
  	@conduct_training  = ConductTraining.new
  end

  def create
    @training = Training.find(params[:conduct_training][:training_id])

    @conduct_training = ConductTraining.new(user_id: current_user.id,training_id: params[:conduct_training][:training_id],set_count: params[:conduct_training][:set_count])
    @conduct_training.save
    redirect_to user_conduct_trainings_path
  end

  private
    def conduct_training_params
        params.require(:conduct_training).permit(:training_id,:user_id,:count_set)
    end
end