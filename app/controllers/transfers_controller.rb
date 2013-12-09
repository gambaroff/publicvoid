class TransfersController < ApplicationController
  before_action :signed_in_user, :set_transfer, only: [:show, :edit, :update, :destroy] 


  # GET /transfers
  # GET /transfers.json
  def index
    @transfers = Transfer.all
  end
  
  def download
    @transfers = Transfer.find(params[:transfer_id])

    send_file @transfer.transferred_file.path,
              :filename => @transfer.transferred_file_file_name,
              :type => @transfer.transferred_file_file_type,
              :disposition => 'attachment'
  end
  
  # GET /transfers/1
  # GET /transfers/1.json
  def show
  end
  
  # GET /transfers/new
  def new
    @transfer = Transfer.new
  end

  # GET /transfers/1/edit
  def edit
  end
  
  # PATCH/PUT /transfers/1
  # PATCH/PUT /transfers/1.json
  def update
    respond_to do |format|
      if @transfer.update(transfer_params)
        format.html { redirect_to @transfer, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # POST /transfers
  # POST /transfers.json
  def create
    @transfer = current_user.transfers.build(transfer_params)
    if @transfer.save
      flash[:success] = "Transfer created!"
      redirect_to root_url
    else
      render 'static_pages/home'
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
  
  def download
    @transfer = Transfer.find(transfer_params)

    send_file @transfer.transferred_file_file_name.path,
              :filename => @transfer.transferred_file_file_name,
              :type => @transfer.transferred_file_file_type,
              :disposition => 'attachment'
  end
  
  private
    
    def set_transfer
      @transfer = Transfer.find(params[:id])
    end

 
    def transfer_params
      params.require(:transfer).permit(:transferred_file )
    end
end
