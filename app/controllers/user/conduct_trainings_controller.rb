class User::ConductTrainingsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@conduct_trainings = current_user.conduct_trainings
  	@conduct_training  = ConductTraining.new
    @training_management = TrainingManagement.new
    require 'date'
    @today = Date.today
  end

  def create
    @training = Training.find(params[:conduct_training][:training_id])

    # 今日のトレーニングの中に重複するトレーニングがない場合
    if ConductTraining.find_by(training_id: conduct_training_params[:training_id]).blank?
      @conduct_training = ConductTraining.new(user_id: current_user.id,training_id: params[:conduct_training][:training_id],set_count: params[:conduct_training][:set_count])
      @conduct_training.save
      redirect_to user_conduct_trainings_path

    # 重複するトレーニングがあった場合
    elsif ConductTraining.find_by(training_id: conduct_training_params[:training_id]).present?
      @conduct_training = ConductTraining.find_by(training_id: conduct_training_params[:training_id])
       # セット数を足す計算
      @conduct_training.set_count = @conduct_training.set_count + conduct_training_params[:set_count].to_i
      @conduct_training.save
      redirect_to user_conduct_trainings_path
    end
  end

  def update
    @conduct_training = ConductTraining.find(params[:id])
    @conduct_training.update(conduct_training_params)
    redirect_to user_conduct_trainings_path
  end

  def destroy
  	@conduct_training = ConductTraining.find(params[:id])
  	@conduct_training.destroy
  	redirect_to user_conduct_trainings_path
  end

  def destroy_all
    current_user.conduct_trainings.destroy_all
    redirect_to user_conduct_trainings_path
  end

  private
    def conduct_training_params
        params.require(:conduct_training).permit(:training_id,:user_id,:set_count)
    end
end