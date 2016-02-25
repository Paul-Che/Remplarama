module SlotsHelper
  def human_slot_range(range)
    "Du #{l(range['start_date'].to_date)} au #{l(range['end_date'].to_date)}"
  end

  def slot_range_id(range)
    "#{range['start_date']}--#{range['end_date']}"
  end
end
