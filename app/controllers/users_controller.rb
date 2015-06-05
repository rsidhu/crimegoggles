class UsersController < ApplicationController
	def index
	  @users = User.all
	end

	def new
  	@user = User.new
	end

	def create
  		@user = User.new(user_params)
	  	if @user.save
	      session[:user_id] = @user.id.to_s
	  	 	redirect_to maps_path
	  	else
	    	render :new
	  	end
	end

	def landing
		unless session[:user_id]
			redirect_to login_path
		else
			render 'maps/index'
		end
	end


	private

	def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
