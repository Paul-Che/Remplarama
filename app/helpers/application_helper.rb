module ApplicationHelper
  def page_header(text)
    content_for(:page_header) { text.to_s }
  end

  def pending_requests_count
    today = Date.today
    @pending_requests_in ||= Slot.joins(:bookings).where(bookings: {accepted: nil}, user: current_user).size
    # @pending_requests_out ||= Booking.where(accepted: nil).where(user: current_user).size
    # @pending_requests_in + @pending_requests_out
    @pending_reviews ||= Slot.joins(:bookings).where(bookings: {end_date: "< #{Date.today}"}, user: current_user).size
    raise
    @pending_requests_in + @pending_reviews
  end

end
