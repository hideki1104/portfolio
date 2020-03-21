class User::WeightsController < ApplicationController
  before_action :authenticate_user!
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
  		@bmi = (@a / ((@user.height * 0.01) * (@user.height * 0.01))).round(2)
  	# 適正体重の計算
  	    @proper_weight = (((@user.height * 0.01) * (@user.height * 0.01)) * 22).round(2)
  	# 適正体重と現在の体重の差
  	    @difference = (@a - @proper_weight).round(2)
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

    # ボタン押した時の条件分岐
        if params[:calculation_button]
          render :new

        else
          if @weight.save
          redirect_to user_weights_path
          else
            render :new
          end
        end
  end

  def create_user
    unless Weight.where(user_id: current_user.id).exists?

    @user = current_user
    @weight = Weight.new
    @weight.weight = current_user.registar_weight
    @weight.user_id = current_user.id
    # BMIの計算
      @a = (@user.registar_weight.to_f)
      @bmi = (@a / ((@user.height * 0.01) * (@user.height * 0.01))).round(2)

      @weight.bmi = @bmi

      @weight.save
      redirect_to user_path(current_user.id)

     else
      redirect_to user_path(current_user.id)
     end
  end

  def index
    @user = current_user
  	@weights = current_user.weights.last
    # 登録時の体重と現在の体重の差
    @weight_difference = (@weights.weight - @user.registar_weight)
    # 現在の体重と適正体重の差
    @proper_weight = (((@user.height * 0.01) * (@user.height * 0.01)) * 22).round(2)
    @proper_weight_difference = (@weights.weight - @proper_weight).round(2)

    # 肥満度
    @bmi = @weights.bmi
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

    # chart_jsにWeightのデータを組み込む為の配列操作
    weights_chart = current_user.weights.pluck(:weight,:created_at)
    @weights_chart = weights_chart.map(&:first)
    @weight_created = weights_chart.map(&:second)
  end

  def destroy
    @weight = Weight.find(params[:id])
    @weight.destroy
    redirect_to user_weights_path
  end

  private
    def weight_params
        params.require(:weight).permit(:user_id,:weight,:bmi)
    end
end