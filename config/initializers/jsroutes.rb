JsRoutes.setup do |config|
#  Note: if you add a new route here, do not forget to run:
#   $ rake tmp:cache:clear
#   before restarting your 'rails s'
  config.include = [
    /^conversations$/,
    /^conversation_messages$/
  ]
end
