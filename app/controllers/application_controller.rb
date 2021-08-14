class ApplicationController < ActionController::Base
  before_action :login_required
  include SessionsHelper
  include Pagy::Backend

  private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
      redirect_to login_url unless current_user
    end

end