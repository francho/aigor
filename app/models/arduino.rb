class Arduino
  include Singleton

  attr_reader :arduino

  def initialize
    port_str  = "/dev/cu.usbmodem1411" #may be different for you
    baud_rate = 115200
    data_bits = 8
    stop_bits = 1
    parity    = SerialPort::NONE

    @arduino = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
    @arduino.read_timeout = 100
  end

  def write(message)
    @arduino.write "#{@command}\n"
  end

  def readlines
    @arduino.readlines
  end
end
