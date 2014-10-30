require "serialport"

class ArduinoCommand
  attr_accessor :command
  attr_accessor :hardware

  def initialize
    @hardware = Arduino.instance
  end

  def execute!
    @hardware.write "#{@command}\n"
    @hardware.serial_port.readlines
  end
end
