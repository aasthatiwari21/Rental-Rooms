class PaymentConfirmationMailer < ApplicationMailer
	default from: email_address_with_name('aastha21tiwari@gmail.com', 'Aastha T')

    def payment_confirmation(user) 
      @user = user
      mail(to: email_address_with_name(@user.email, @user.name), subject: "Property Confirmation" )
  	end
end
