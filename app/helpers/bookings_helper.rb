module BookingsHelper

  def find_practice_user(booking)
    if booking.slot.user.has_practice
      booking.slot.user
    else
      booking.user
    end
  end

  def find_locum_user(booking)
    if booking.slot.user.has_practice
      booking.user
    else
      booking.slot.user
    end
  end

end

