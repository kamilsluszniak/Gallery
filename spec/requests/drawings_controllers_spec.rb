require 'rails_helper'

RSpec.describe "DrawingsControllers", type: :request do
  describe "GET /drawings_controllers" do
    it "works! (now write some real specs)" do
      get drawings_controllers_path
      expect(response).to have_http_status(200)
    end
  end
end
