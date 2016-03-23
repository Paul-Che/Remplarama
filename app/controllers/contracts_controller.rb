class ContractsController < ApplicationController

  def create
    @contract = Contract.new(contract_params)
    @contract.save
    authorize @contract
    redirect_to accepted_bookings_path
  end

  def show
    set_contract
    @practice_user = find_practice_user(@contract)
    @locum_user = find_locum_user(@contract)
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "test" #"Contract_RemplaMatch_#{@contract.id}"
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
    if contract.booking.user.has_practice
      contract.booking.user
    else
      contract.booking.slot.user
    end
  end

  def find_locum_user(contract)
    if contract.booking.user.has_practice
      contract.booking.slot.user
    else
      contract.booking.user
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

