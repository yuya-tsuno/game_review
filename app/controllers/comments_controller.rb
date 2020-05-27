class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action -> {restrict_access(@comment.user_id)}, only: [:edit, :update, :destroy]

  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to game_path(@game.id), notice: '投稿できませんでした...' }
      end
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id], game_id: params[:game_id])
    restrict_access(comment.user_id)
    comment.destroy
    redirect_to game_path(params[:game_id]), notice:"レビューを削除しました！"
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to game_path(@comment.game_id), notice: "コメントを編集しました！"
    else
      render :edit
    end
  end
  
  private

  def comment_params
    params.require(:comment).permit(:body, :game_id, :user_id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
