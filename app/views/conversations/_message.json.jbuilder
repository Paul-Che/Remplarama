json.extract! message, :id, :read_at
json.writer_avatar message.user.avatar
json.writer_first_name message.user.first_name
json.writer_last_name message.user.last_name
json.created_at message.created_at.strftime("%b %e, %l:%M%P")
json.content simple_format(message.content)
