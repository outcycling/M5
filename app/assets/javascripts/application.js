// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require tinymce

function timer_values () {
  min = $('#Minutes').val();
  if(min < 0 || (Number.isInteger(parseInt(min))===false)){
    min = 0;
    $('#Minutes').val(parseInt(0));
  }
  sec = $('#Seconds').val();
  if(sec < 0 || (Number.isInteger(parseInt(sec))===false)){
    sec = 0;
    $('#Seconds').val(parseInt(0));
  }
  time = parseInt(sec) + parseInt(min*60);

  return time;
}

function set_up_timer(){
  time = timer_values();
  var theSpan = document.getElementById('timeLeft');
  theSpan.innerHTML = min + ":" + ("0" + sec).slice(-2);
}

function updateTimeSpan() {

  var theSpan = document.getElementById('timeLeft');

  var m = parseInt(time / 60);
  var s = parseInt(time % 60);

    if(s>-1 && $('#start_timer').text()==="Stop") {
      theSpan.innerHTML = m + ':' + ("0" + s).slice(-2);
      setTimeout('updateTimeSpan()', 1000);}
    else{
      if(s===-1){
        $('#start_timer').text('Start');
        timer_on = false;
        alert("timer done");
      }
      return;
    }
    time -= 1;
}


$(document).ready(function(){

  timer_on = false;
  set_up_timer();
  temp_val_m = $('#Minutes').val();
  temp_val_s = $('#Seconds').val();
  m_reset_value = 5;
  s_reset_value = 0;
  currentTime = 300;
  reset_clicked_time = 300;
  resetted = true;
  $('#Minutes, .timer').css("display","none");
  $('#Seconds').css("display","none");


  $('#start_timer').on('click',function(){
    $('#Minutes, .timer').css("display","none");
    $('#Seconds').css("display","none");
    $('#timeLeft').css("display","inline-block");

    if(timer_on===false){
      $(this).text('Stop');
      timer_on = true;
      m = $('#Minutes').val();
      s = $('#Seconds').val();
      resetted = false;
      if ((parseInt(m_reset_value))===parseInt(m) && (parseInt(s_reset_value))===parseInt(s) ){
        tc=false;
      }else{
        m_reset_value = $('#Minutes').val();
        s_reset_value = $('#Seconds').val();
        time = timer_values();
        // timer_clicked_time = time;
        tc = true;
      }
      updateTimeSpan();
    }else{
      timer_on = false;
      $(this).text('Start');
      tc = false;
    }
  });

  $('#reset_timer').on('click',function(){
    $('#start_timer').text('Start');
    resetted = true;
    temp_val_m = $('#Minutes').val();
    temp_val_s = $('#Seconds').val();
    reset_clicked_time = parseInt(temp_val_m*60) + parseInt(temp_val_s);
    timer_clicked_time = parseInt(m_reset_value*60) + parseInt(s_reset_value);
if (timer_clicked_time != reset_clicked_time){
  tc = true;
}
    if(timer_on===true || tc===true){
      time = timer_clicked_time;
    }else{
      reset_clicked_time = parseInt(temp_val_m*60) + parseInt(temp_val_s);
    }
    timer_on = false;

console.log("time: " + parseInt(time));

    if (timer_clicked_time === reset_clicked_time){

      if(tc===false){
        time = currentTime;
        timer_clicked_time = currentTime;
        var theSpan = document.getElementById('timeLeft');
        theSpan.innerHTML = (parseInt(time/60)) + ":" + ("0" + (time%60)).slice(-2);
      }else{
        time = (parseInt(temp_val_m*60)) + parseInt(temp_val_s);
        var theSpan = document.getElementById('timeLeft');
        theSpan.innerHTML = temp_val_m + ":" + ("0" + temp_val_s).slice(-2);
        currentTime = time;
      }
    }else{

      time = (parseInt(temp_val_m*60)) + parseInt(temp_val_s);
      var theSpan = document.getElementById('timeLeft');
      theSpan.innerHTML = temp_val_m + ":" + ("0" + temp_val_s).slice(-2);

      currentTime = time;
    }

    $('#Minutes, .timer').css("display","none");
    $('#Seconds').css("display","none");
    $('#timeLeft').css("display","inline-block");
  });

  $('#timeLeft').on('click',function(){
    $(this).css("display","none");
    $('#Minutes, .timer').css("display","inline-block");
    $('#Seconds').css("display","inline-block");
    // currentTime = time;
    if(resetted===false || timer_on===true){
      time+=1;
    }
    resetted = false;
    timer_on = false;
    $('#start_timer').text('Start');
    $('#Minutes').val(parseInt(time/60));
    $('#Seconds').val(parseInt(time%60));

    m_reset_value = $('#Minutes').val();
    s_reset_value = $('#Seconds').val();

    tc = false;

  });
});