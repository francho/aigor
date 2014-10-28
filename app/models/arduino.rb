class Arduino
  include Singleton

  def initialize
    port_str  = Rails.application.config.aigor.arduino['port']
    baud_rate = Rails.application.config.aigor.arduino['baud_rate'].to_i
    data_bits = Rails.application.config.aigor.arduino['data_bits'].to_i
    stop_bits = Rails.application.config.aigor.arduino['stop_bits'].to_i
    parity    = Rails.application.config.aigor.arduino['parity'].to_i


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
