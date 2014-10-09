require 'spec_helper'

feature 'Switch leds' do

  before do
    visit(root_path)
  end

  scenario 'it has a button to switch leds' do
    expect(page).to have_selector('input[type=checkbox]#leds-switch')
    # page.execute_script %($('leds-switch-label').click())
  end

  scenario 'it has a red selector' do
    expect(page).to have_selector('#slide-red')
  end

  scenario 'it has a green selector' do
    expect(page).to have_selector('#slide-green')
  end

  scenario 'it has a blue selector' do
    expect(page).to have_selector('#slide-blue')
  end
end
