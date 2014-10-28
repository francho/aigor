require 'spec_helper'

describe ControlPanelController, type: :controller do

  describe 'home' do
    before do
      get :index
    end

    it 'exists' do
      expect(response).to be_success
    end

    it 'is html' do
      expect(response.headers['Content-Type']).to include 'text/html; charset=utf-8'
    end
  end

end
