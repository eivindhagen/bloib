require 'active_support/secure_random'

class Demo::EmailsController < ApplicationController
  def index
    
  end

  def new
    random_string = ActiveSupport::SecureRandom.hex(16)
    @email = {:from => 'sender@bloib.com', :to => 'receiver@bloib.com', :subject => Time.now, :body => random_string}
  end

  def create
    @email = params[:email]
    logger.error "@email = #{@email}"
    DemoMailer.demo_email(@email).deliver
  end

end
