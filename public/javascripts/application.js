Capture = {
  max_reqs: 100,
  run: false
}

Capture.start = function(){
  Capture.run = true
  Capture.get_capture_at(new Date(), 0)
  Capture.dialog$ = $('#capture_dialog').dialog({
    modal: true,
    title: "Capturing card",
    close: function(){ Capture.stop() },
    width: 400
  })
}

Capture.stop = function(){
  Capture.run = false
  Capture.dialog$ && Capture.dialog$.dialog('close')
}

Capture.get_capture_at = function(time, req){
  $.ajax({
    url: '/cards/captured',
    data: {'capture_time' : time.toString()},
    type: "POST",
    success: function(data, testStatus, xhr){
      if(Capture.run){
        if(data.match("NOT FOUND") && req < Capture.max_reqs){
          setTimeout("Capture.get_capture_at('" + time.toString() + "'," + (req+1).toString() + " )", 2000)
        }else{
          $('#card_id,#hidden_card_id').val(data)
          $('#card_capture #message').text('Card captured!')
          setTimeout(function(){ Capture.stop() }, 1000)
        }
      }
    },
    error: function(xhr, test, thrown){
      $('#card_capture span').text("Server Error")  
    }
  })
}

Door = {}

Door.open = function(name){
  var dialog$ = $('#door_dialog').dialog({
    modal: true,
    title: 'Opening ' + name.replace(/_/,' ') + '.... '
  })
  $.get('/door/open/' + name, function(data){
    setTimeout(function(){dialog$.dialog('close')}, 1000)
  })
}

$(function(){
  //global
  $('button').button()

  //edit card
  $('#start_capture').click(Capture.start)
  $('#stop_capture').click(Capture.stop)
  $('#edit_id').click(function(){ $('#card_id').attr('disabled',false)})
  
  //dashboard
  $('.open_door').click(function(event){
    event.preventDefault();
    Door.open($(this).attr('id'))
  })
})
