class StaticPagesController < ApplicationController
  def home
    @asset_transfer = current_user.asset_transfers.build if signed_in?
  end

  def help
  end
end
