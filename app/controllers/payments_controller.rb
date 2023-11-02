class PaymentsController < ApplicationController
  before_action :create_payment_stripe_customer

  before_action :authenticate_user!

 before_action :payment_confirm , only: [:success]

  def new
  end

  def create
    @property = Property.find_by(id: params.as_json["property_id"].to_i)
    @amount = @property.rent*100
    @product = create_product
    @price = create_price
    session=Stripe::Checkout::Session.create({line_items: [{price: @price, quantity: 1}],mode: 'payment', success_url: 'http://localhost:3000' + '/payment/success' }) 
    redirect_to session.url, allow_other_host: true
  end
  
  def success
    @property=Property.find_by(params[:id])
    @property.unavailable!  
    flash[:success]= 'Congratulations you have booked the property'
    render :success
  end

  def cancel
    flash[:alert] = "Your Payment is Failed Please Try Again"
    redirect_to property_path
  end

	def payment_history
    @property=Property.find_by(params[:id])
    @payment = Payment.create!(user: current_user, property: @property, amount: @property.rent, status: 'paid')
    @property.unavailable!
  end


  private
  
  def create_product
    Stripe::Product.create({
        name: 'Basic Dashboard',
        default_price_data: {
          unit_amount: @amount,
          currency: 'usd',
          recurring: {interval: 'month'},
        },
        expand: ['default_price'],
      })
  end

  def create_price
    Stripe::Price.create({product: @product.id, unit_amount: @amount, currency: 'usd'})
  end

  def create_payment_stripe_customer
    stripe_customer = Stripe::Customer.create({email: current_user.email})
    current_user.update(stripe_id: stripe_customer.id)
  end
  
  def payment_confirm
    @property=Property.find_by(params[:id])
    user = @property.user
    PaymentConfirmationMailer.payment_confirmation(current_user).deliver_now
    PaymentConfirmationMailer.payment_confirmation(user).deliver_now

  end
  

end