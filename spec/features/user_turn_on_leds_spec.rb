require 'spec_helper'

feature 'Switch leds' do

  before do
    visit(root_path)
  end


  it 'has canvas to draw a color wheel' do
    expect(page).to have_selector('#canvas')
  end


end
