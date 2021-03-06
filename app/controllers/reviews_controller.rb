class ReviewsController < ApplicationController
  before_action :find_book
  before_action :find_review, only: [:edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.book_id = @book.id
    @review.user_id = current_user.id
    
    if @review.save
      flash[:info] = "Review Created"
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @review.update(review_params)
      flash[:info] = "Review Created"
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    flash[:danger] = "Review removed"
    redirect_to book_path(@book)
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
  def find_book
    @book = Book.friendly.find(params[:book_id])
  end
  def find_review
  @review = Review.find(params[:id])
  end
end
