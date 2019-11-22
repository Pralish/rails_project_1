class CommentsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :destroy]

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to request.referer
          else
            flash.now[:danger] = "error"
          end
        
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        authorize @comment
        @comment.destroy
        redirect_to post_path(@post)
    end

    private def comment_params
        params.require(:comment).permit(:body)
    end


end
