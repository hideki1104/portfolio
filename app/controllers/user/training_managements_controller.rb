class User::TrainingManagementsController < ApplicationController

  before_action :authenticate_user!
  def index
    # @training_managementの中に時間、トレーニング名、回数、セット数を配列で入れる
  	@training_management = []
      current_user.training_managements.each do |management|
      management.training_records.each do |record|
        @a = {}
        @a[:created_at] = management.created_at
        @a[:training_name] = record.training.training_name
        @a[:number_time] = record.training.number_time
        @a[:set_count] = record.set_count
        @training_management << @a
      end
    end
  end

  def show
  end

  def create
  	# 記録するボタンを押した時
  	@training_management = TrainingManagement.new
  	@training_management.user_id = current_user.id


  	if @training_management.save!

       # 実施トレーニング種目を１つ１つを空箱を作ってセーブする
  	   current_user.conduct_trainings.each do |conduct|

    	   @training_record = TrainingRecord.new
    	   @training_record.training_management_id = @training_management.id
    	   @training_record.training_id = conduct.training_id
    	   @training_record.set_count = conduct.set_count
    	   @training_record.save!
	     end

    	   current_user.conduct_trainings.destroy_all
    	   redirect_to user_training_managements_path
    	else
    	   redirect_to user_conduct_trainings_path
    	end
    end

  private
    def training_management_params
        params.require(:training_management).permit(:user_id)
    end

  private
    def training_record_params
        params.require(:training_record).permit(:training_id,:training_management_id,:set_count)
    end
end