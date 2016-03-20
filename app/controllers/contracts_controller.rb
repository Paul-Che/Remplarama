class ContractsController < ApplicationController

  def create
    @contract = Contract.new(contract_params)
    @contract.save
    authorize @contract
    redirect_to accepted_bookings_path
  end

  def show
    set_contract
    respond_to do |format|
      #format.html
      format.pdf do
        render pdf: "Contract_RemplaMatch_#{@contract.id}"
      end
    end
  end

  private

  def set_contract
    @contract = Contract.find(params[:id])
    authorize @contract
  end

  def contract_params
    params.require(:contract).permit(:id, :contract_type, :booking_id)
  end

end

