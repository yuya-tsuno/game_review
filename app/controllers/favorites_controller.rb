class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favorite = current_user.favorites.create(game_id: params[:game_id])
    redirect_to game_path(favorite.game.id), notice: "#{favorite.game.title}を気になる登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    restrict_access(favorite.user_id)
    favorite.destroy
    redirect_to game_path(favorite.game.id), notice: "#{favorite.game.title}の気になるを解除しました"
  end
end
