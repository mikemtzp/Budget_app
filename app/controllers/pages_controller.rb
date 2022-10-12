class PagesController < ApplicationController
  def splash_screen
    redirect_to groups_path if user_signed_in?
  end
end
