class AssetTransfersController < ApplicationController
  before_action :signed_in_user, :set_asset_transfer, only: [:show, :edit, :update, :destroy] 


  # GET /asset_transfers
  # GET /asset_transfers.json
  def index
    @asset_transfers = AssetTransfer.all
  end
  
  # GET /asset_transfers/1
  # GET /asset_transfers/1.json
  def show
  end
  
  # GET /asset_transfers/new
  def new
    @asset_transfer = AssetTransfer.new
  end

  # GET /asset_transfers/1/edit
  def edit
  end
  
  # PATCH/PUT /asset_transfers/1
  # PATCH/PUT /asset_transfers/1.json
  def update
    respond_to do |format|
      if @asset_transfer.update(asset_transfer_params)
        format.html { redirect_to @asset_transfer, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asset_transfer.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # POST /asset_transfers
  # POST /asset_transfers.json
  def create
    @asset_transfer = current_user.asset_transfers.create(asset_transfer_params)
    if @asset_transfer.save
      flash[:success] = "Your asset is transferred into the void!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  # DELETE /asset_transfers/1
  # DELETE /asset_transfers/1.json
  def destroy
    @asset_transfer.destroy
    respond_to do |format|
      format.html { redirect_to asset_transfers_url }
      format.json { head :no_content }
    end
  end
  
  private
    
    def set_asset_transfer
      @asset_transfer = AssetTransfer.find(params[:id])
    end

 
    def asset_transfer_params
      params.require(:asset_transfer).permit(:upload )
    end
end  

