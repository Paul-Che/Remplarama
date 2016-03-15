json.extract! message, :id, :read_at

if message.user.avatar.nil?
  json.writer_avatar "http://res.cloudinary.com/antoinelo/image/upload/c_fill,h_75,w_75/v1458055110/placeholder_pic_zl88ww.png"
else
  json.writer_avatar "http://res.cloudinary.com/antoinelo/image/upload/c_fill,h_75,w_75/#{message.user.avatar.path}"
end

json.writer_first_name message.user.first_name
json.writer_last_name message.user.last_name
json.created_at message.created_at.strftime("%b %e, %l:%M%P")
json.content simple_format(message.content)
