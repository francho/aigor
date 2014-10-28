class ApiController < ApplicationController
  respond_to :json, :except => :index

  def colorize_leds
    color = params[:color]

    command = ColorizeLedsCommand.new(color[:red],color[:green],color[:blue])
    response=command.execute!

    ApiHelper.websocket_broadcast('/control_panel/messages', params)
    respond_with do |format|
      format.json { render :text => response }
    end
  end
end
