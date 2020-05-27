class Admin::ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin?
  
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
        redirect_to admin_review_path(@review.id), notice: "レビューを作成しました！"
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
      redirect_to admin_review_path(@review), notice: "レビューを編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to admin_reviews_path, notice:"レビューを削除しました！"
  end

  private

  def review_params
    params.require(:review).permit(:direction, :operability, :story, :volume, :like, :summary, :body, :game_id, :user_id)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
