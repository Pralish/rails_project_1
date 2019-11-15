class PostsController < ApplicationController

  before_action :get_post, only:  [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def new
    @post = current_user.posts.build
  
  end

  def index
    @posts = Post.all
  end

  def show
    # @post = Post.find(params[:id])
  end

  def create 
    #render plain: params[:post].inspect
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
       render :new
    end
  end 

  def edit
    # @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
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
    @post.destroy
    redirect_to posts_path
  end


  private 
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def get_post
    @post = Post.find(params[:id]) 
  end
end
