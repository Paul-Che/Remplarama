var ConversationListItem = React.createClass({
  render: function() {
    var divClasses = classNames({
      "conversation-link": true,
      "flexbox-start": true,
      "selected": this.props.conversation.id == this.props.selectedConversationId
    })
    var iClasses = classNames({
      "fa": this.props.is_last_message_writer_current_user,
      "fa-reply": this.props.is_last_message_writer_current_user && !this.props.last_message_read_at,
      "fa-check": this.props.is_last_message_writer_current_user && this.props.last_message_read_at,
      "small-badge": !this.props.is_last_message_writer_current_user,
      "small-badge-off": !this.props.is_last_message_writer_current_user && this.props.last_message_read_at
    })
    return(
      <div className={divClasses} onClick={this.handleClick}>
        <span className="flex-item-shrink">
          <img src={this.props.conversation.other_user_picture_url} className='avatar-square-big'/>
        </span>
        <div className="conversation-preview flexbox-columns flex-item">
          <ul className="conversation-header list-unstyled list-inline flex-item">
            <li><h6><strong>{this.props.conversation.other_user_first_name}</strong></h6></li>
            <li className="date">{this.props.conversation.last_message_created_at}</li>
          </ul>
          <div className="message-preview flex-item">
            <i className={iClasses}> </i>&nbsp;&nbsp;
            <span>{this.props.conversation.last_message_content}</span>
          </div>
        </div>
      </div>
    )
  },

  handleClick: function() {
    // TODO appeler une méthode de Inbox
    this.props.onConversationSelection(this.props.conversation.id)
  }
})
