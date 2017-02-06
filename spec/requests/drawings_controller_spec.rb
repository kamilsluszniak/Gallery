require 'rails_helper'

RSpec.describe DrawingsController, type: :controller do
  describe "create" do
    
    before do
      post :create
    end
    it "redirects when not logged in" do
      expect(response).to have_http_status(302)
    end
    
    it "redirects to #new when save failed" do
      
    end
  end
end
