class ContractsController < ApplicationController

  def create
    @contract = Contract.new(contract_params)
    @practice_user = find_practice_user(@contract)
    @locum_user = find_locum_user(@contract)
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

  def find_practice_user(contract)
    if contract.user1.has_practice
      contract.user1
    else
      contract.user2
    end
  end

  def find_locum_user(contract)
    if contract.user1.has_practice
      contract.user2
    else
      contract.user1
    end
  end

  def find_other_user(contract)
    if booking.user == current_user
      booking.slot.user
    else
      booking.user
    end
  end

end

