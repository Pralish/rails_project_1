class Api::PostsController < Api::BaseController
  before_action :set_post , only: [:show, :update, :destroy]
  before_action :authorize_request
    def index
        @posts = Post.all
        render json: @posts 
    end

    def show
        render json: @post
    end


  def create 
    @post = current_user.posts.build(post_params)
    if @post.save
      render json: {data: @post }
    else
        render json: {data: @post.errors}
    end
  end 

  def search
    if params[:q].blank?
      render json: {error: 'empty field'}
    else
      @parameter = params[:q].downcase
      @posts = Post.all.where("lower(body) LIKE ?" , "%" + @parameter + "%")
      @users = User.all.where("lower(name) LIKE ?" , "%" + @parameter + "%")
      render json: {posts: @posts, users: @users}
    end
  end

  def update
    @post.update(post_params)

    head :no_content
  end 

  def destroy
    @post.destroy
    head :no_content
  end

    private 

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:body, images: [])
    end
  


end