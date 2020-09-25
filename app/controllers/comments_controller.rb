class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update]
  before_action -> {restrict_access(@comment.user_id)}, only: [:edit, :update]

  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { render :index, notice: '投稿できませんでした...' }
      end
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], game_id: params[:game_id])
    restrict_access(@comment.user_id)
    @comment.destroy
    render :index
  end

  def edit
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit_error }
      end
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
