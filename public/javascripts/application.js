// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
//

Capture = {
  max_reqs: 100,
  running: false
}

Capture.button_clicked = function(){
  if( Capture.running ){
    Capture.running = false
    $('#card_capture span').hide()
    $('#card_capture button').text('Capture Card')
  }else{
    Capture.running = true
    $('#card_capture button').text('Stop')
    $('#card_capture span').show()
    Capture.get_capture_at(new Date(), 0)
  }
}

Capture.get_capture_at = function(time, req){
  $.ajax({
    url: '/cards/captured',
    data: {'capture_time' : time.toString()},
    type: "POST",
    success: function(data, testStatus, xhr){
      if(Capture.running){
        if(data.match("NOT FOUND") && req < Capture.max_reqs){
          setTimeout("Capture.get_capture_at('" + time.toString() + "'," + (req+1).toString() + " )", 2000)
        }else{
          $('#card_capture button').text('Card captured!')
          $('#card_capture button').show()
          $('#card_capture span').hide()
          $('#card_id,#hidden_card_id').val(data)
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
  var activity$ = $('#' + name + '_activity').show()
  $.get('/door/open/' + name, function(data){
    activity$.fadeOut('slow')
  })
}

$(function(){
  $('#card_capture button').click(Capture.button_clicked)
  $('#edit_id').click(function(){ $('#card_id').attr('disabled',false)})
  $('.open_door').click(function(event){
    event.preventDefault();
    Door.open($(this).attr('id'))
  })
})
