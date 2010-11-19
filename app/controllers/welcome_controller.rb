class WelcomeController < ApplicationController
  def index
    render :text => "welcome:<br />::Rails.root.to_s=#{::Rails.root.to_s}"
  end

end
