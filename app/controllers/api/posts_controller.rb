class Api::PostsController < Api::BaseController
  before_action :authorize_request
    def index
        @posts = Post.all
        render :index
    end

    def show
        @post = Post.find(params[:id])
        render json: {data: @post}
    end


  def create 
    @post = Post.new(post_params)
    
    if @post.save
      render json: {data: @post }
    else
        render json: {data: @post.errors}
    end
  end 


    private 
    def post_params
      params.require(:post).permit(:body, images: [])
    end
  


end