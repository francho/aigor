RSpec.describe 'control_panel/pomodoro.html.erb', :type => :view do

  before(:each) do
    render
  end

  describe 'pomodoro form' do
    it 'has an input for minutes' do
      expect(response).to have_selector('input[name=pomodoro_minutes]')
    end

    it 'has a button to start pomodoro' do
      expect(response).to have_selector('a#stop-pomodoro')
    end
  end

  describe 'timer' do
    it 'has a clock' do
      expect(response).to have_selector('div#pomodoro-countdown-timer')
    end

    it 'has a button to stop pomodoro' do
      expect(response).to have_selector('a#stop-pomodoro')
    end
  end
end
