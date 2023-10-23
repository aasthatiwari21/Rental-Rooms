class BookingsController < ApplicationController
  before_action :authenticate_user!
  def new
    
  end
  def create
    @booking = current_user.bookings.build(booking_params)
    @property = Property.find(params[:property_id])
    payment_intent = Stripe::PaymentIntent.create({
      amount: @property.price * 100, # Amount in cents
      currency: 'usd', # Replace with your currency
      description: 'Property booking',
      payment_method_types: ['card'],
    })
    @booking.payment_intent_id = payment_intent.id
    if @booking.save
      redirect_to payment_path(@booking)
    else
      render :new
    end
  end
  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :property_id,:user_id)
  end
end