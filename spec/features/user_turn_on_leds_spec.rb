require 'spec_helper'

feature 'Switch leds' do

  before do
    visit(root_path)
  end

  scenario 'it has a button to switch leds' do
    expect(page).to have_selector('input[type=checkbox]#leds-switch')
    # page.execute_script %($('leds-switch-label').click())
  end

  scenario 'it has canvas to draw a color wheel' do
    expect(page).to have_selector('#canvas')
  end


end
