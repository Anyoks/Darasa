class UserController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
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
