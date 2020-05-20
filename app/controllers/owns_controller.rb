class OwnsController < ApplicationController
  before_action :authenticate_user!

  def create
    own = current_user.owns.create(game_id: params[:game_id])
    redirect_to game_path(own.game.id), notice: "#{own.game.title}を持ってる登録しました"
  end

  def destroy
    own = current_user.owns.find_by(id: params[:id])
    restrict_access(own.user_id)
    own.destroy
    redirect_to game_path(own.game.id), notice: "#{own.game.title}の持ってるを解除しました"
  end
end
