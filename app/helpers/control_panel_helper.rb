module ControlPanelHelper
  def self.websocket_broadcast(channel, params)
    message = {:channel => channel, :data => params}
    uri     = URI.parse("http://192.168.33.2:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
