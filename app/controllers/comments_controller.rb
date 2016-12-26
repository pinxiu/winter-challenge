class CommentsController < ApplicationController
  :before_filter :merge_params, :only => :create

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment posted! Your progress has been logged."
      redirect_to root_url
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
      redirect_to root_url
    end

  end

  private
    def comment_params
      params.require(:comment).permit(:name, :team, :mission_id, :content)
    end

    def merge_params
        params[:comment].merge!{
          
        }
    end
end
