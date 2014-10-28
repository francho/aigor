class ColorizeLedsCommand < ArduinoCommand
  def initialize red, green, blue
    super()
    set_color red, green, blue
  end

  def set_color(red, green, blue)
    @command="#{red},#{green},#{blue}"
  end
end
