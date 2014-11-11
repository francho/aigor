require 'spec_helper'

RSpec.describe AigorUtils::ControlPanelNotifier do
  describe ':websocket_broadcast' do
    it 'emmit a websocket message' do
      channel = '/control_panel/messages'
      params  = [:power_on => true, :color => ['red' => 100, 'green' => 200, 'blue' => 50]]

      allow(Net::HTTP).to receive(:post_form)
      notifier = AigorUtils::ControlPanelNotifier.new
      notifier.websocket_broadcast(params)

      expected_url     = URI.parse(Rails.application.config.aigor.websockets_url)
      expected_message = {:message => {:channel => channel, :data => params}.to_json}

      expect(Net::HTTP).to have_received(:post_form).with(expected_url, expected_message)
    end
  end
end
