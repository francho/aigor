require 'spec_helper'

describe ControlPanelController do

  describe 'home' do
    before do
      get :index
    end

    it 'exists' do
      expect(response).to be_success
    end

    it 'is html' do
      expect(response.headers['Content-Type']).to include 'text/html; charset=utf-8'
    end
  end

  describe 'webservices' do

    describe 'switch_led' do
      before do
        allow(ControlPanelHelper).to receive(:websocket_broadcast)
        post :switch_led, :format => :json, :power_on => true, :color => [ :red => 'ff', :green => 'aa', :blue => 'ff' ]
      end

      it 'accept POST' do
        expect(response).to be_success
      end

      it 'is json' do
        expect(response.headers['Content-Type']).to include 'application/json; charset=utf-8'
      end

      it 'emit a websocket message' do
        expect(ControlPanelHelper).to have_received(:websocket_broadcast)
      end
    end

  end

end
