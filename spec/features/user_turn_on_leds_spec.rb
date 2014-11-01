require 'spec_helper'

feature 'leds control' do

  before do
    visit(root_path)
    page.execute_script 'window.Faye = {}'

    expect(page).not_to have_errors
  end

    it 'it has a button to switch leds', :js => true do
      expect(page).to have_selector('input[type=checkbox]#leds-switch')
    end


  it 'it has a red selector', :js => true  do
    expect(page).to have_selector('#slide-red')
  end

  it 'it has a green selector', :js => true  do
    expect(page).to have_selector('#slide-green')
  end

  it 'it has a blue selector', :js => true  do
    expect(page).to have_selector('#slide-blue')
  end
end
