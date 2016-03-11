class UserController < ApplicationController
  def index
  	@users = User.all.order(created_at: :desc)
  end

  def show
  	@user = User.find(params[:id])
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
end
