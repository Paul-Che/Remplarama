module ApplicationHelper
  def page_header(text)
    content_for(:page_header) { text.to_s }
  end

  def pending_requests_count
    @pending_requests ||= Slot.joins(:bookings).where(bookings: {accepted: nil}).where(user: current_user).size
  end

end
