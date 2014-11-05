require 'spec_helper'

describe ColorizeLedsCommand do
  let(:command) {
    allow(Arduino).to receive(:instance) { double('Arduino').as_null_object }
    # double('ColorizeLedsCommand', :execute! => true).as_null_object

    double_color_command = double('ColorizeLedsCommand')
    allow(double_color_command).to receive(:execute!)

    command = PomodoroCommand.new
    command.color_command = double_color_command
    command
  }

  after do
    command.stop if command
  end

  describe 'start' do
    it 'schedule green led to finish' do
      expect(command.pomodoro_job).to be(nil)
      command.start 5
      expect(command.pomodoro_job.scheduled?).to be(true)
    end

    it 'schedule the finish in X minutes' do
      command.start 5
      start_minutes = (Time.now.to_i / 60).to_i
      end_minutes   = (command.pomodoro_job.time.to_i / 60).to_i
      expect(end_minutes-start_minutes).to eql(5)
    end

    it 'set green color when finish' do
      expect(command.color_command).to receive(:set_color).with(0,255,0)
      command.start 1
      command.pomodoro_job.call
    end
  end

  describe 'stop' do
    before do
      command.start 5
    end

    it 'stops pomodoro job' do
      expect(command.pomodoro_job).to_not be(nil)
      command.stop
      expect(command.pomodoro_job).to be(nil)
    end

    it 'stops countdown job' do
      expect(command.color_countdown_job).to_not be(nil)
      command.stop
      expect(command.color_countdown_job).to be(nil)
    end
  end
end
