require 'rails_helper'

RSpec.describe DrawingsController, type: :controller do
  
  before(:all) do
    @user = FactoryGirl.create(:user)
    @drawing_params = FactoryGirl.attributes_for(:drawing)
  end
    
  describe "create" do
    it "redirects when not logged in" do
      post :create
      expect(response).to have_http_status(302)
    end
    
    it "redirects to #new when save failed" do
      login_with @user
      expect { post :create, params: {drawing: @drawing_params }}.to change(Drawing, :count).by(1)
    end
  end
end
