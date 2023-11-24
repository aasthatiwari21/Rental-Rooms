class Api::ReviewsController <ApplicationController
  skip_before_action :verify_authenticity_token
 
  def index
   render json: ReviewSerializer.new(Review.all),status:200
  end
  def create
    review = Review.new(review_params)
    if review.save
      render json: {data: review}, status: 200
    else
      debugger
      render json: {errors: review.errors.messages},status: 422
    end
  end

   def update
    review = Review.find_by(params[:id])
    if review.update(review_params)
      render json: {data: review}, status:200
    else
      render json: {errors: review.errors.messages}, status: 422
    end
  end

  def destroy
    review = Review.find_by(params[:id])
    review.destroy
    render json: {errors: review.errors.messages},status:200
  end
  def show
       review = Review.find_by(params[:id])
       render json: ReviewSerializer.new(review)
   end
private

  def review_params
    params.permit(:rating,:comment,:user_id,:property_id)
  end
end