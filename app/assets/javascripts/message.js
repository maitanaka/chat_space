$(function() {

  function return_message_html(message) {

    var html = '<div class="chat-message__header clearfix"><p class = "chat-message__name">' + message.user.name + '</p><p class="chat-message__date">' + message.created_at  + '</p></div><p class="chat-message__content">' + message.text + '</p>';

      return html;
  }

  $('.chat-footer').on('submit', function(e) {
    e.preventDefault();
    var fd = new FormData($("#new_message")[0]);

    $.ajax({
      type: 'POST',
      url: window.location.href + '.json',
      data: fd,
      processData: false,
      contentType: false,
      dataType: 'json',
      success: function(data){
        $('#message_text').val('');
        var html = return_message_html(data)
        $('.chat-messages__message').append(html);
      },
      error: function() {
           alert('問題がありました。');
         }
      });
    });
  });
