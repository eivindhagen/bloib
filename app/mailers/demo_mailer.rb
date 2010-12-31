class DemoMailer < ActionMailer::Base
  default_url_options[:host] = "bloib.com"
  #  default :from => "from@example.com"
  
  def demo_email(email)
    @email = email
    mail(@email) # generate the email, and send it
  end
  
end
