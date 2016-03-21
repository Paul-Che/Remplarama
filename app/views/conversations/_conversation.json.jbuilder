json.extract! conversation, :id


if conversation.other_user(current_user).avatar.nil?
  json.other_user_picture_url "http://res.cloudinary.com/antoinelo/image/upload/c_fill,h_75,w_75/v1458055110/placeholder_pic_zl88ww.png"
else
  json.other_user_picture_url "http://res.cloudinary.com/antoinelo/image/upload/c_fill,h_75,w_75/#{conversation.other_user(current_user).avatar.path}"
end

json.other_user_first_name conversation.other_user(current_user).first_name
json.other_user_last_name conversation.other_user(current_user).last_name
json.last_message_created_at conversation.last_message.created_at.strftime("%b %e")
json.last_message_content conversation.last_message.content
json.last_message_read_at conversation.last_message.read_at
json.is_last_message_writer_current_user conversation.last_message.user == current_user
