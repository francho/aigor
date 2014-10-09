class ControlPanelController < ApplicationController
  respond_to :html, :only => :index
  respond_to :json, :except => :index

  def index
  end

  def switch_led
    ApplicationHelper.websocket_broadcast('/control_panel/messages', params)
    respond_with do |format|
      format.json { render :text => "ack" }
    end
  end
end