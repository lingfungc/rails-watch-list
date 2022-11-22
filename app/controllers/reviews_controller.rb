class ReviewsController < ApplicationController
  # def method_name
  #   @review = Review.find(params[:id])
  # end

  def new
    @review = Review.new
    @list = List.find(params[:list_id])
  end

  def create
    @review = Review.new(review_params)
    @review.list = List.find(params[:list_id])
    if @review.save
      redirect_to list_path(@review.list)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to list_path(@review.list), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
