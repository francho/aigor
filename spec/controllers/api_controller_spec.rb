require 'spec_helper'

describe ApiController, :type => :controller do

  before do
    allow(Arduino).to receive(:instance) { double('Arduino').as_null_object }
    allow(ApiHelper).to receive(:websocket_broadcast)
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
      expect(ApiHelper).to have_received(:websocket_broadcast)
    end
  end

  describe 'POST pomodoro' do
    before do
      post :pomodoro, :format => :json, :minutes => 5
    end

    it 'accept POST' do
      expect(response).to be_success
    end

    it 'is json' do
      expect(response.headers['Content-Type']).to include 'application/json; charset=utf-8'
    end

    it 'emit a websocket message' do
      expect(ApiHelper).to have_received(:websocket_broadcast)
    end
  end


end
