var ConversationList = React.createClass({
  render: function() {
    return(
      <div className="flexbox-columns-start">
        {this.props.conversations.map(function(conversation, index) {
          return <ConversationListItem
                    conversation={conversation}
                    key={index}
                    // TODO props
                  />
        })}
        <div className="end-of-messages">
          <p>Fin des messages</p>
        </div>
      </div>
    )
  }
})
