class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      RegisterMailer.welcome_email(@user).deliver_now
  	  redirect_to root_url
      flash[:success] = 'Registration complete'
  	else
  	  render 'new'
  	end
  end

  def show
  	@user = User.find(params[:id])
    @upcoming_events = user.upcoming_events
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
