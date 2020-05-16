class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  
  def index
    @games = Game.all
  end
  
  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(game_params)
    if params[:back]
      render :new
    else
      if @game.save
        redirect_to game_path(@game.id), notice: "ゲームを作成しました！"
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(game_id: @game.id)
    @own = current_user.owns.find_by(game_id: @game.id)
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to game_path(@game.id), notice: "ゲームを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to games_path, notice:"ゲームを削除しました！"
  end

  private

  def game_params
    params.require(:game).permit(:title, :company, :genre, :price, :released_at, :story, :icon, :icon_cache)
  end

  def set_game
    @game = Game.find(params[:id])
  end

end
