class PostsController < ApplicationController

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    render json: post, status: :accepted
    # if post.valid?
    #   render json: post
    # else
    #   render json: {errors: post.errors}, status: :unprocessable_entity
    # end
  # rescue ActiveRecord::RecordInvalid => invalid
  #   render json: {errors: post.errors}, status: :unprocessable_entity
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

end
