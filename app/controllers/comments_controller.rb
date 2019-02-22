class CommentsController < ApplicationController


    def new
      @comment = Comment.new
      # @comment.topic_id = params[:topic_id]
    end

    def create
      comment = Comment.new(comment_params)
      comment.user_id = current_user.id
      # if Comment.create(comment_params)
      #   redirect_to topics_path, notice:'コメント成功しました'
      # else
      #   flash.now[:alert] = 'コメント失敗'

      if comment.save
        redirect_to topics_path, success: 'コメントを投稿しました'
      else
        redirect_to topics_path, danger: 'コメントの投稿に失敗しました'
      end
    end

    private
    def comment_params
      params.require(:comment).permit(:body, :topic_id, :user_id)
    end

end
