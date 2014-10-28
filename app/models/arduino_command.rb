require "serialport"

class ArduinoCommand
  attr_accessor :command

  def execute!
    Arduino.instance.write "#{@command}\n"
    Arduino.instance.serial_port.readlines
  end
end
