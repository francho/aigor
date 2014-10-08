require 'spec_helper'

describe ControlPanelHelper do
  describe ':websocket_broadcast' do
    it 'emmit a websocket message' do
      channel = '/test'
      params  = [:power_on => true, :color => ['red' => 'ff', 'green' => 'aa', 'blue' => 'ff']]

      allow(Net::HTTP).to receive(:post_form)
      ControlPanelHelper.websocket_broadcast(channel, params)

      expected_url     = URI.parse(Rails.application.config.aigor.websockets_url)
      expected_message = {:message => {:channel => channel, :data => params}.to_json}

      expect(Net::HTTP).to have_received(:post_form).with(expected_url, expected_message)
    end
  end
end
