require 'spec_helper'

describe ColorizeLedsCommand do

  describe 'send the rgb command' do
    it '!' do
      arduino_command = ColorizeLedsCommand.new(10,20,30)
      expect(arduino_command.command).to eql '10,20,30'
    end
  end
end
