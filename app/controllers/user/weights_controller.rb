class User::WeightsController < ApplicationController
  def new
  	@user = current_user
  	@weight = Weight.new
  	@weight.user_id = current_user.id
  end

  def create
  	@user = current_user
  	@weight = Weight.new(weight_params)
  	@weight.user_id = current_user.id
  	  	# BMIの計算
  		@a = (params[:weight][:weight].to_f)
  		@bmi = (@a / ((@user.height * 0.01) * (@user.height * 0.01)))
  	# 適正体重の計算
  	    @proper_weight = ((@user.height * 0.01) *2) * 22
  	# 適正体重と現在の体重の差
  	    @difference = (@a - @proper_weight)
  	# 肥満度
  	    if @bmi < 16
  	    	@degree = "痩せすぎ"
  	    elsif @bmi >= 16.00 && @bmi <= 16.99
  	    	@degree = "痩せ"
  	    elsif @bmi >= 17.00 &&  @bmi <= 18.49
  	    	@degree = "痩せぎみ"
  	    elsif @bmi >= 18.50 && @bmi <= 24.99
  	    	@degree = "普通体重"
  	    elsif @bmi >= 25.00 && @bmi <= 29.99
  	    	@degree = "前肥満"
  	    elsif @bmi >= 30.00 && @bmi <= 34.99
  	    	@degree = "肥満(1度)"
  	    elsif @bmi >= 35.00 &&  @bmi <= 39.99
  	    	@degree = "肥満(2度)"
  	    elsif 40.00 < @bmi
  	    	@degree = "肥満(3度)"
  	    end

  	    @weight.bmi = @bmi

  	    @weight.save
	render :new
  end

  def index
  	@weights = Weight.all
  end

  private
    def weight_params
        params.require(:weight).permit(:user_id,:weight,:bmi)
    end
end