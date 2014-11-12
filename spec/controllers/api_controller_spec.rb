require 'spec_helper'

describe ApiController, :type => :controller do

  before do
    allow_any_instance_of(AigorUtils::ControlPanelNotifier).to receive(:websocket_broadcast).and_return(true)
    allow(Arduino).to receive(:instance) { double('Arduino').as_null_object }
  end

  describe 'POST colorize_leds' do
    before do
      post :colorize_leds, :format => :json, :power_on => true, :color => {:red => 100, :green => 150, :blue => 200}
    end

    it 'accept POST' do
      expect(response).to be_success
    end

    it 'is json' do
      expect(response.headers['Content-Type']).to include 'application/json; charset=utf-8'
    end

    it 'emit a websocket message' do
      expect_any_instance_of(AigorUtils::ControlPanelNotifier).to receive(:notify_color_change)
      post :colorize_leds, :format => :json, :power_on => true, :color => {:red => 100, :green => 150, :blue => 200}
    end
  end

  describe 'POST pomodoro_start' do
    before do
      post :pomodoro_start, :format => :json, :minutes => 5
    end

    after do
      @command=PomodoroCommand.new
      @command.stop
    end

    it 'accept POST' do
      expect(response).to be_success
    end

    it 'is json' do
      expect(response.headers['Content-Type']).to include 'application/json; charset=utf-8'
    end

    it 'emit a websocket message' do
      expect_any_instance_of(AigorUtils::ControlPanelNotifier).to receive(:notify_pomodoro_step)
      post :pomodoro_start, :format => :json, :minutes => 5
      sleep(2)
    end
  end

  describe 'POST pomodoro_stop' do
    before do
      post :pomodoro_stop, :format => :json, :minutes => 5
    end

    after do
      @command=PomodoroCommand.new
      @command.stop
    end

    it 'accept POST' do
      expect(response).to be_success
    end

    it 'is json' do
      expect(response.headers['Content-Type']).to include 'application/json; charset=utf-8'
    end

    it 'emit a websocket message' do
      expect_any_instance_of(AigorUtils::ControlPanelNotifier).to receive(:notify_pomodoro_stop)
      post :pomodoro_stop, :format => :json
      sleep(2)
    end
  end

end
