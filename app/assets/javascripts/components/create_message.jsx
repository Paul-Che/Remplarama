var CreateMessage = React.createClass({
  render: function() {
    return(
      <div className="message-input" id="newMessage">
        <textarea id="newTextarea" placeholder="Répondez ici..."></textarea>
        <div className="actions flexbox hidden">
          <button className="btn btn-stop hidden">Cancel</button>
          <button className="btn btn-send hidden">Send</button>
        </div>
      </div>
    )
  }
})
