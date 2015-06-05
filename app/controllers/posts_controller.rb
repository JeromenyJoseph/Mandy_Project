class PostsController < ApplicationController
  def create
    @post = Post.new
    if @post.save
    flash[:notice] = "You have created a new recipe"
    redirect_to user_path
  else
    flash[:alert] = "There was a problem submitting your recipe."
    redirect_to new_post_path
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find_by(title: params[:title])
    if @post.destroy
      flash[:notice] = "Your recipe was successfully deleted"
      redirect_to new_post_path
    else 
      flash[:alert] = "There was a problem deleting your recipe."
  end
end

