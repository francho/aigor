require 'spec_helper'

describe ArduinoCommand do
  include RSpec::Mocks::ExampleMethods


  # let(:serial_port) {
  #   serial_port_double = double('SerialPort')
  #   allow(serial_port_double).to receive(:read_timeout=)
  #   allow(serial_port_double).to receive(:readlines)
  #   allow(serial_port_double).to receive(:write)
  #   allow(serial_port_double).to receive(:close)
  #
  #   return serial_port_double
  # }
  let(:arduino_command) { ArduinoCommand.new }

  before do
    class_spy('Arduino')
    instance_spy('Arduino.instance')
    allow(Arduino.instance).to receive(:write)
    # allow(SerialPort).to receive(:new).and_return(serial_port)
  end

  describe 'execute' do
    it 'has a public method to execute!' do
      expect(arduino_command).to respond_to :execute!
    end

    it 'talks with Arduino through serial (it adds an end line char)' do
      arduino_command.command = 'hi dude'
      arduino_command.execute!

      expect(Arduino.instance).to have_received(:write)
    end
  end
end
