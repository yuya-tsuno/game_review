class GamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game, only: [:show]
  
  def index
    # binding.pry
    unless params[:q].nil?
      if params[:q][:price_gteq].present? && params[:q][:price_lt].present?
        if params[:q][:price_gteq] > params[:q][:price_lt]
          flash[:notice] = "価格の検索範囲を正しく入力してください。"
          redirect_to games_path
        end
      end

      if params[:q][:released_at_gteq].present? && params[:q][:released_at_lteq].present?
        if params[:q][:released_at_gteq].to_time > params[:q][:released_at_lteq].to_time
        flash[:notice] = "発売日の検索範囲を正しく入力してください。"
          redirect_to games_path
        end
      end
    end

    @q = Game.ransack(params[:q])
    if params[:order_by_direction] # 演出点数順（降順）
      @games = Game.select('games.*', 'sum(reviews.direction) * 5 / count(reviews.id) AS reviews').left_joins(:reviews).group('games.id').order('reviews desc').page(params[:page]).per(100)
      params.delete("order_by_direction")
    elsif params[:order_by_operability] # 操作性点数順（降順）
      @games = Game.select('games.*', 'sum(reviews.operability) * 5 / count(reviews.id) AS reviews').left_joins(:reviews).group('games.id').order('reviews desc').page(params[:page]).per(100)
      params.delete("order_by_operability")
    elsif params[:order_by_story] # ストーリー点数順（降順）
      @games = Game.select('games.*', 'sum(reviews.story) * 5 / count(reviews.id) AS reviews').left_joins(:reviews).group('games.id').order('reviews desc').page(params[:page]).per(100)
      params.delete("order_by_story")
    elsif params[:order_by_volume] # ボリューム点数順（降順）
      @games = Game.select('games.*', 'sum(reviews.volume) * 5 / count(reviews.id) AS reviews').left_joins(:reviews).group('games.id').order('reviews desc').page(params[:page]).per(100)
      params.delete("order_by_volume")
    elsif params[:order_by_like] # ハマり度点数順（降順）
      @games = Game.select('games.*', 'sum(reviews.like) * 5 / count(reviews.id) AS reviews').left_joins(:reviews).group('games.id').order('reviews desc').page(params[:page]).per(100)
      params.delete("order_by_like")
    elsif params[:order_by_sum] # 合計点数順（降順）
      @games = Game.select('games.*', '(sum(reviews.direction) + sum(reviews.operability) + sum(reviews.story) + sum(reviews.volume) + sum(reviews.like)) / count(reviews.id) AS reviews')
      .left_joins(:reviews).group('games.id').order('reviews desc').page(params[:page]).per(100)
      params.delete("order_by_sum")
    elsif params[:order_by_reviews] # レビュー個数順（降順）
      @games = Game.select('games.*', 'count(reviews.id) AS reviews').left_joins(:reviews).group('games.id').order('reviews desc').page(params[:page]).per(100)
      params.delete("order_by_reviews")
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
    @comment = @game.comments.build
    @comments = @game.comments
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
