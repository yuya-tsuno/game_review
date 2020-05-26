class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action -> {restrict_access(@review.user_id)}, only: [:edit, :update, :destroy]
  
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end
  
  def create
    @review = current_user.reviews.build(review_params)
    if params[:back]
      render :new
    else
      if @review.save
        # @review.game.favorites.each do |favorite|
        #   ReviewMailer.inform_mail(@review, favorite.user).deliver
        # end
        redirect_to review_path(@review.id), notice: "レビューありがとうございます！！"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to review_path(@review.id), notice: "レビューを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to user_path(@review.user_id), notice:"レビューを削除しました！"
  end

  private

  def review_params
    params.require(:review).permit(:direction, :operability, :story, :volume, :like, :summary, :body, :game_id, :user_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
