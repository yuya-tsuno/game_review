class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: [:show]
  
  def index
    @q = Game.ransack(params[:q])
    if params[:order_by_direction] # 演出点数順（降順）
      @games = Game.all.includes(:reviews).order("reviews.direction desc").page(params[:page]).per(10)
    elsif params[:order_by_operability] # 操作性点数順（降順）
      @games = Game.all.includes(:reviews).order("reviews.operability desc").page(params[:page]).per(10)
    elsif params[:order_by_story] # ストーリー点数順（降順）
      @games = Game.all.includes(:reviews).order("reviews.story desc").page(params[:page]).per(10)
    elsif params[:order_by_volume] # ボリューム点数順（降順）
      @games = Game.all.includes(:reviews).order("reviews.volume desc").page(params[:page]).per(10)
    elsif params[:order_by_like] # ハマり度点数順（降順）
      @games = Game.all.includes(:reviews).order("reviews.like desc").page(params[:page]).per(10)
    elsif params[:order_by_sum] # ハマり度点数順（降順）
      @games = Game.select(‘games.*’, ‘sum(reviews.direction) + sum(reviews.operability) + sum(reviews.story) + sum(reviews.volume) + sum(reviews.like) AS reviews’)
      .left_joins(:reviews).group(‘games.id’).order(‘reviews desc’)
    elsif params[:order_by_reviews] # レビュー個数順（降順）
      @games = Game.select('games.*', 'count(reviews.id) AS reviews').left_joins(:reviews).group('games.id').order('reviews desc').page(params[:page]).per(10)
    else # 追加順（デフォルト、降順）
      @q.sorts = 'created_at desc' if @q.sorts.empty?
      @games = @q.result(distinct: true).page(params[:page]).per(10)
    end
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
    @comments = @game.comments
    @comment = @game.comments.build
    @favorite = current_user.favorites.find_by(game_id: @game.id)
    @own = current_user.owns.find_by(game_id: @game.id)
  end

  private

  def game_params
    params.require(:game).permit(:title, :company, :genre, :price, :released_at, :story, :icon, :icon_cache)
  end

  def search_params
    params.require(:q).permit(:title_or_company_cont, :price_gteq, :price_lt, :genre_eq, :released_at_gteq, :released_at_lteq)
  end

  def set_game
    @game = Game.find(params[:id])
  end

end
