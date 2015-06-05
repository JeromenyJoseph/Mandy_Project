class UsersController < ApplicationController
before_action :current_user, only: [:edit, :update, :show, :destroy]

  def index
    @user = User.all
  end

  def create
  @user = User.new(user_params)
    if @user.save
          flash[:notice] = "Your account was created
          successfully. Please log in."
          redirect_to new_session_path
      else
        flash[:alert] = "There was a problem saving your
        account."
        redirect_to new_user_path
    end
  end
  
    

   def new
      @user = User.new
   end


   def edit
    current_user
   end

   def update
    
      if @user.update_attributes(user_params)
          # Handle a successful update.
      else
        render 'edit'
      end
   end


   def show
    current_user
   end

  # def follow
  #   @relationship = Relationship.new(follower_id: current_user.id, followed_id: params[:id])
  #   @user = User.find(params[:id])
  #   if @relationship.save
  #     flash[:notice] = "You've successfully followed #{@user.username}."
  #   else
  #     flash[:alert] = "There was an error following that user."
  #   end
  #   redirect_to username_path(@user.username)
  # end

  # def unfollow
  #   @relationship = Relationship.find(follower_id: current_user.id, 
  #     followed_id: params[:id])
  #   @user = User.find(params[:id])
  #   if @relationship and @relationship.destroy 
  #     flash[:notice] = "You've successfully unfollowed #{@user.username}."
  #   else
  #     flash[:alert] = "There was an error unfollowing that user."
  #   end
  #   redirect_to username_path(@user.username)
  # end
      


    def destroy
      current_user
      # @user= User.find_by(:username params[:username])
      if @user.destroy
      flash[:notice] = "Your account was successfully deleted."
      redirect_to user_path
      else
        flash[:alert] = "There was a problem deleting your account."
        redirect_to destroy_user_path
      end
     end

   

     private


  def current_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:username, :email, :password, :fname, :lname, :birthday, :avatar)
  end
end