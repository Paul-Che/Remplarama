var MessageListItem = React.createClass({
  render: function() {
    return(
      <div className="message-container flexbox-start flex-item">
        <span class="flex-item-shrink">
          <img src={this.props.message.writer_avatar} className="avatar-square-small"/>
        </span>
        <div className="message-content flex-item flexbox-columns">
          <ul className="message-header list-unstyled list-inline flex-item">
            <li><h6><strong>{this.props.message.writer_first_name}</strong></h6></li>
            <li className="date">{this.props.message.created_at}</li>
          </ul>
          <span dangerouslySetInnerHTML={{__html: this.props.message.content}}></span>
        </div>
      </div>
    )
  }
})
