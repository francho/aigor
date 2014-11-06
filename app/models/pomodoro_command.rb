class PomodoroCommand
  include Wisper::Publisher

  attr_accessor :scheduler, :color_command, :green_step

  def initialize
    @scheduler     = Rufus::Scheduler.singleton
    @color_command = ColorizeLedsCommand.new(0, 0, 0)
  end

  def start(minutes)
    schedule_end minutes
    start_color_countdown
  end

  def stop
    @scheduler.unschedule color_countdown_job if color_countdown_job
    @scheduler.unschedule pomodoro_job if pomodoro_job
  end

  def pause
    color_countdown_job.pause
    pomodoro_job.pause
  end

  def resume
    color_countdown_job.resume
    pomodoro_job.resume
  end

  def pomodoro_job
    scheduler.jobs(tags: 'pomodoro').first
  end

  def color_countdown_job
    scheduler.jobs(tags: 'countdown').first
  end

  private

  def schedule_end(minutes)
    ColorizeLedsCommand.new(255, 0, 0).execute!
    @pomodoro_job = @scheduler.schedule_in("#{minutes}m", tag: 'pomodoro') do
    @color_command.set_color(0, 255, 0)
    @color_command.execute!
    @scheduler.unschedule color_countdown_job
  end
end

def start_color_countdown
  @green_step= 255 / (pomodoro_job.time - Time.now)

  @color_countdown_job = @scheduler.every('1s', tag: 'countdown') do
  colorize_step
end

end

def colorize_step
  return unless pomodoro_job.scheduled? && pomodoro_job.time
  remain = pomodoro_job.time - Time.now
  green  = 255 - (@green_step * remain).to_i
  puts "#{remain} g: #{green} step: #{@green_step}"

  return unless (0..255).include? green

  @color_command.set_color(255, green, 0)
  @color_command.execute!

  broadcast(:pomodoro_step, remain)
end

end
