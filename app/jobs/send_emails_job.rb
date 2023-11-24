class SendEmailsJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    puts 'after perform'
  end
  def perform(user)
    UserMailer.welcome_email(user).deliver_now
    puts "Hellooooooooooooooooooooooooooooooooooooooooooooooooooooo"
  end
end
