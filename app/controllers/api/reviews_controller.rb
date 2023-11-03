class Api::ReviewsController <ApplicationController
  skip_before_action :verify_authenticity_token
 
  def index
   render json: ReviewSerializer.new(Review.all)
  end
   def create
    if (current_user.role == "Seeker")
       review = Review.new(review_params)
       if review.save
        render json: {data: review}
      else
        render json: {errors: review.errors.messages}
      end
    end
   end
   def update
    review = Review.find(params[:id])

    if review.update(review_params)
      render json: {data: review}
    else
      render json: {errors: review.errors.messages}
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    render json: {errors: review.errors.messages}
  end
  def show
       review = Review.find(params[:id])
       render json: ReviewSerializer.new(review)
   end
private

  def review_params
    params.permit(:rating,:comment,:user_id,:property_id)
  end
end