class ReviewsController < ApplicationController


    def create
        Review.new(comment: params[:review][:comment], 
        user_id: current_user.id,
        property_id: params[:property_id].to_i,
        rating: params[:review][:rating].to_i).save!
        redirect_to property_path
    end

 def destroy
    @property = Property.find(params[:property_id])
    @review = @property.reviews.find(params[:id])
    @review.destroy
    redirect_to property_path(@property), status: :see_other
  end

  private

  def review_params
    params.require(:review).permit(:rating,:comment)
  end
end










