class Api::PostsController < Api::BaseController
  before_action :authorize_request
    def index
        @posts = Post.all
        # render :indexpost
        render json: @posts 
    end

    def show
        @post = Post.find(params[:id])
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




    private 
    def post_params
      params.require(:post).permit(:body, images: [])
    end
  


end