class Admin::OwnsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?
  
  def index
    @owns = Own.all
  end

  def create
    own = current_user.owns.create(game_id: params[:game_id])
    redirect_to admin_game_path(own.game.id), notice: "#{own.game.title}を持ってる登録しました"
  end

  def destroy
    own = current_user.owns.find_by(id: params[:id]).destroy
    redirect_to admin_game_path(own.game.id), notice: "#{own.game.title}の持ってるを解除しました"
  end
end
