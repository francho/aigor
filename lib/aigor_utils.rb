module AigorUtils
  class ControlPanelNotifier
    attr_accessor :channel

    def initialize
      @channel='/control_panel/messages'
    end

    def notify_color_change(color_data)
      websocket_broadcast(color_data)
    end

    def notify_pomodoro_step(seconds_remain)
      data={:action => 'pomodoro_step', :seconds_remain => seconds_remain}
      websocket_broadcast(data)
    end

    def websocket_broadcast(params)
      message = {:channel => @channel, :data => params}
      uri     = URI.parse(Rails.application.config.aigor.websockets_url)
      Net::HTTP.post_form(uri, :message => message.to_json)
    end
  end
end
