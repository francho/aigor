require 'spec_helper'

RSpec.describe ApiHelper, :type => :helper do
  describe ':websocket_broadcast' do
    it 'emmit a websocket message' do
      channel = '/test'
      params  = [:power_on => true, :color => ['red' => 100, 'green' => 200, 'blue' => 50]]

      allow(Net::HTTP).to receive(:post_form)
      ApiHelper.websocket_broadcast(channel, params)

      expected_url     = URI.parse(Rails.application.config.aigor.websockets_url)
      expected_message = {:message => {:channel => channel, :data => params}.to_json}

      expect(Net::HTTP).to have_received(:post_form).with(expected_url, expected_message)
    end
  end
end
