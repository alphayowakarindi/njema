class SplashController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :login_status

  def index; end

  private

  def login_status
    return unless user_signed_in?

    redirect_to groups_path
  end
end
