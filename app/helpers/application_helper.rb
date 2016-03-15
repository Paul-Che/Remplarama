module ApplicationHelper
  def page_header(text)
    content_for(:page_header) { text.to_s }
  end

  def pending_requests_count
    @pending_requests_in ||= Slot.joins(:bookings).where(bookings: {accepted: nil}, user: current_user).size
  end

  def conversation_exists(user1, user2)
    number_of_conversations = Conversation.where(user1_id: user1.id, user2_id: user2.id).size +
    Conversation.where(user1_id: user2.id, user2_id: user1.id).size

    number_of_conversations > 0
  end

end
