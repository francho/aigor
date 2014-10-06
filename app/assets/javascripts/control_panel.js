'use strict';

(function() {

  function slide2hex(slideSelector) {
    var dec = parseInt($(slideSelector).attr('data-slider') * 255 / 100);
    var hex = dec.toString(16);
    return hex.length === 1 ? '0' + hex : hex;
  }

  function getSelectedRgbColor() {
    return '#' + slide2hex('#slide-red') + slide2hex('#slide-green') + slide2hex('#slide-blue');
  }

  function colorizeLedsSwitch() {
    var ledsOn = $('#leds-switch').is(':checked');
    var rgb = ledsOn ? getSelectedRgbColor() : '';

    $('#leds-switch-label').css({'background': rgb});
  }

  function switchLeds(turnOn) {
    colorizeLedsSwitch();
  }

  $(document).ready(function() {
    $('#slide-red').on('change.fndtn.slider', colorizeLedsSwitch);
    $('#slide-green').on('change.fndtn.slider', colorizeLedsSwitch);
    $('#slide-blue').on('change.fndtn.slider', colorizeLedsSwitch);

    $('#leds-switch').on('click', function() {
      switchLeds($(this).checked);
    });

    $(function() {
      var faye = new Faye.Client('http://localhost:9292/faye');
      alert('subscribing!')
      faye.subscribe('/control_panel/messages', function(data) {
        console.log(data);
      });
    });
  });

})();