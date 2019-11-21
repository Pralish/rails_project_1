class PostsController < ApplicationController

  before_action :get_post, only:  [:edit, :show, :update, :destroy]
  before_action :authenticate_user!


  def index
    @posts = Post.page(params[:page])
    @post = current_user.posts.build    
  end

  def show
    # @post = Post.find(params[:id])

   end

  def create 
    #render plain: params[:post].inspect
    @post = current_user.posts.build(post_params)
    authorize @post
    if @post.save
      redirect_to posts_path
    else
       render :new
    end
  end 

  def edit
    # @post = Post.find(params[:id])

  end

  def update
    # @post = Post.find(params[:id])
    authorize @post
   if @post.update(post_params)
    
    redirect_to @post 
   else
    flash[:error] = "updated suceessfully"
    flash.keep
    render 'edit'
   end
  end

  def destroy
    # @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to posts_path
  end


  private 
  def post_params
    params.require(:post).permit(:body, images: [])
  end

  def get_post
    @post = Post.find(params[:id]) 
  end
end
