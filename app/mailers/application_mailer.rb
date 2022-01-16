class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@demo-twitter-app-ca.herokuapp.com'
  layout 'mailer'
end
