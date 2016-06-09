class UserController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
    data = []
    lables = User.group_by_month(:created_at).count
    @data = {
      labels: lables.map {|label, data| label.strftime("%B") },
      datasets: [
        {
           label: "My First dataset",
           pointStrokeColor: "#FFA500",
           fillColor: "rgba(255,165,0,0.5)",
           pointColor: "rgba(255,165,0,1)",
           strokeColor: "rgba(255,165,0,1)",
           data: lables.map {|label, data| data  }
        }
      ]
    }
    @options = {}
  end

  def show
    @user = User.find(params[:id])
    @failed_payments = @user.failed_payments
    unit_data = @user.unit_activities.group(:name).count
    failed_payment_data = @user.failed_payments.group(:topic_id).count
   


    @unit_data = {
      labels: unit_data.map { |labels, value|  labels},
      datasets: [
        {
          data: unit_data.map { |labels, value| value },
          backgroundColor: colour(unit_data) ,
          hoverBackgroundColor: colour(unit_data)
        }
      ]      
    }

    @failed_payment_data = {
      labels: failed_payment_data.map { |labels, value|  labels},
      datasets: [
        {
          data: failed_payment_data.map { |labels, value| value },
          backgroundColor: colour(failed_payment_data),
          hoverBackgroundColor: colour(failed_payment_data)
        }
      ]      
    }

    @test = {
      labels: ["t","e","G"],
      datasets: [
        {
            data: [1,2,3],
            backgroundColor: ["925e4d", "b75bf6", "a097fe"],
            hoverBackgroundColor: ["925e4d", "b75bf6", "a097fe"]
        }
      ]
    }

  @pieData = [
        {
          value: 35,
          color:"#3F9F3F"
        },
        {
          value: 100-35,
          color: "#222"
        }
      ]


     @options = {}
  end

  def make_moderator
    @user = User.find(params[:user_id])
    @user.make_moderator
    respond_to do |format|
      format.html { redirect_to user_index_path, notice:  " #{@user.first_name} is now a Moderator." }
      format.json { head :no_content }
    end
  end
  def make_normal_user
    @user = User.find(params[:user_id])
    @user.make_normal_user
    respond_to do |format|
      format.html { redirect_to user_index_path, notice:  " #{@user.first_name} is now a Normal User." }
      format.json { head :no_content }
    end
  end



  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_index_path, notice:  " #{@user.first_name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def colour  data
    colour = []
    data.count.times do
       g = "%06x" % (rand * 0xffffff)
       colour << g
    end
    return colour
  end
end
