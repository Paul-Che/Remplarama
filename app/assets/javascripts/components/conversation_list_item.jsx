var ConversationListItem = React.createClass({
  render: function() {
    return(
      <div className="conversation-link flexbox-start">
        <span className="flex-item-shrink">
          <img src={this.props.conversation.other_user_picture_url} className='avatar-square-big'/>
        </span>
        <div className="conversation-preview flexbox-columns flex-item">
          <ul className="conversation-header list-unstyled list-inline flex-item">
            <li><h6><strong>{this.props.conversation.other_user_first_name}</strong></h6></li>
            <li className="date">{this.props.conversation.last_message_created_at}</li>
          </ul>
          <div className="message-preview flex-item">
            <span>{this.props.conversation.last_message_content}</span>
          </div>
        </div>
      </div>
    )
  }
})
