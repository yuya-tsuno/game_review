class CommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to game_path(@game), notice: '投稿できませんでした...' }
      end
    end

    def destroy
      Comment.find_by(id: params[:id], game_id: params[:game_id]).destroy
      redirect_to game_path(params[:game_id]), notice:"レビューを削除しました！"
    end
    
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :game_id, :user_id)
  end
end
