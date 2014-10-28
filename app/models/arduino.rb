class Arduino
  include Singleton

  def initialize
    port_str  = "/dev/cu.usbmodem1411" #may be different for you
    baud_rate = 115200
    data_bits = 8
    stop_bits = 1
    parity    = SerialPort::NONE

    @serial_port = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
    @serial_port.read_timeout = 100
    puts @serial_port.flush_input
    puts @serial_port.flush_output
  end

  attr_reader :serial_port

  def write(message)
    @serial_port.write "#{message}\n"
  end

  def readlines
    @serial_port.readlines
  end
end
