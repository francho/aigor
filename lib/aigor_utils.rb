module AigorUtils
  class ControlPanelNotifier
    attr_accessor :channel

    def initialize
      @channel='/control_panel/messages'
    end

    def pomodoro_step(seconds_remain)
      data={action: 'pomodoro_step', seconds_remain: seconds_remain}
      websocket_broadcast(data)
    end

    private

    def websocket_broadcast(params)
      message = {:channel => @channel, :data => params}
      uri     = URI.parse(Rails.application.config.aigor.websockets_url)
      Net::HTTP.post_form(uri, :message => message.to_json)
    end
  end
end
