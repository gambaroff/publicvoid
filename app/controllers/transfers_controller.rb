class TransfersController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]


  # GET /transfers
  # GET /transfers.json
  def index
    @uploads = Upload.all
  end
 

  # POST /transfers
  # POST /transfers.json
  def create
   @transfer = Transfer.new(transfer_params)
   
     respond_to do |format|
      if @transfer.save
        format.html { redirect_to @transfer, notice: 'Upload was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transfer }
      else
        format.html { render action: 'new' }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /transfers/1
  # DELETE /transfers/1.json
  def destroy
    @transfer.destroy
    respond_to do |format|
      format.html { redirect_to transfers_url }
      format.json { head :no_content }
    end
  end
end
