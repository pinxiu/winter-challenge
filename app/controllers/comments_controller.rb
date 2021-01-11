class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.team = Player.where(:name => comment.name).first.team.name
    comment.student_multiplier = 1
    if ['Alvin Tan', 'Rick Zhong', 'Sean Zhang', 'Kevin Lee', 'Youchen (Victor) Zhang', 'Jenny Huang', 'Jacklyn Ang'].include?(comment.name)
      comment.student_multiplier = 2
    end
    if comment.save
      flash[:success] = "Comment posted! Your progress has been logged."
      redirect_to root_url
    else
      flash[:error] = @comment.errors.full_messages.to_sentence
      redirect_to root_url
    end

  end

  private
    def comment_params
      params.require(:comment).permit(:name, :team, :mission_id, :content, :avatar, :video, :multiplier, :student_multiplier)
    end
end