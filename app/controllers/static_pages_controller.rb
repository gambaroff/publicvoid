class StaticPagesController < ApplicationController
  def home
    @transfer = current_user.transfers.build if signed_in?
  end

  def help
  end
end
