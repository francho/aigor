module ApiHelper
  def self.websocket_broadcast(channel, params)
    message = {:channel => channel, :data => params}
    uri     = URI.parse(Rails.application.config.aigor.websockets_url)
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
