class RegisterMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
  	@user = user
  	@url  = 'http://example.com/login'
  	mail(to: @user.email, subject: "Welcome to Private Events")
  end
end