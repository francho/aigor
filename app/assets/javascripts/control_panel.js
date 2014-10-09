'use strict';

(function() {

  function slide2hex(slideSelector) {
    var dec = parseInt($(slideSelector).attr('data-slider') * 255 / 100);
    var hex = dec.toString(16);
    return hex.length === 1 ? '0' + hex : hex;
  }

  function hex2slide(slideSelector, hex) {
    var dec = parseInt(hex,16);
    var value = dec * 100 / 255
    $(slideSelector).foundation('slider', 'set_value', value);
  }

  function getSelectedRgbColor() {
    return '#' + slide2hex('#slide-red') + slide2hex('#slide-green') + slide2hex('#slide-blue');
  }

  function colorizeLedsSwitch() {
    var ledsOn = $('#leds-switch').prop('checked');
    var rgb = ledsOn ? getSelectedRgbColor() : '';

    $('#leds-switch-label').css({'background': rgb});
  }

  function switchLeds() {
    console.log('switchLeds');
    colorizeLedsSwitch();
    $.ajax({
      type: 'POST',
      url : "control_panel/switch_led.json",
      data: {
        power_on: $('#leds-switch').prop('checked'),
        color   : {
          red  : slide2hex('#slide-red'),
          green: slide2hex('#slide-green'),
          blue : slide2hex('#slide-blue')
        }
      }
    });
  }

  function updatePanel(data) {
    if(data.action === 'switch_led') {
      $('#leds-switch').prop('checked', data.power_on === 'true');
      hex2slide('#slide-red', data.color.red);
      hex2slide('#slide-green', data.color.green);
      hex2slide('#slide-blue', data.color.blue);
      colorizeLedsSwitch();
    }
  }

  $(function() {
    $('#slide-red').on('change.fndtn.slider', switchLeds);
    $('#slide-green').on('change.fndtn.slider', switchLeds);
    $('#slide-blue').on('change.fndtn.slider', switchLeds);
    $('#leds-switch').click(switchLeds);
  });

  $(function() {
    var faye = new Faye.Client('http://192.168.33.2:9292/faye');
    faye.subscribe('/control_panel/messages', updatePanel);
  });

})();