class NewPropertyMailer < ApplicationMailer
	 default from: 'aastha21tiwari@gmail.com'
    def new_property_notification(seeker) 
      @seeker = seeker 
          attachments.inline['friends'] = File.read("#{Rails.root}/app/assets/images/friends")
      mail( to: seeker.email, subject: "New Property Notification" )
  end
end
