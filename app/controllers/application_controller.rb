class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pagy::Backend

  private

  def required_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end

end