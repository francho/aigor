require "serialport"

class ArduinoCommand
  attr_accessor :command
  attr_accessor :arduino

  def initialize
    @arduino=Arduino.instance
  end

  def execute!
    @arduino.write "#{@command}\n"
    @arduino.readlines
  end
end
