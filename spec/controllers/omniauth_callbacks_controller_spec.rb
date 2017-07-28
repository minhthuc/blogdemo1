require "rails_helper"

RSpec.describe OmniauthCallbacksController, type: :controller do
  context "post show" do
    it "should sucess" do
      get :facebook
      expect(response).to have_http_status 200
    end
  end
end
