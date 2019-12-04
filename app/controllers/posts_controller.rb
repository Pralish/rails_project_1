class PostsController < ApplicationController

  before_action :authenticate_user!
  before_action :get_post, only:  [:edit, :show, :update, :destroy]


  def index
    @posts = Post.page(params[:page])
    @post = current_user.posts.build  
      
  end

  def search
    if params[:search].blank?
      redirect_to(root_path, aleart: "Empty field") and return
    else
       @parameter = params[:search].downcase
      @results = User.all.where("lower(name) LIKE ?" , "%" + @parameter + "%")
    end
  end

  def show
    # @post = Post.find(params[:id])

   end

  def create 
    #render plain: params[:post].inspect
    @post = current_user.posts.build(post_params)
    authorize @post
    respond_to do |format|
      if @post.save
        format.js
        format.html {redirect_to posts_path}
      else
        format.html {render :new}
      end
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
