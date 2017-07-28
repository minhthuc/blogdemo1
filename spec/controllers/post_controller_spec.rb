require "rails_helper"

RSpec.describe PostsController, type: :controller do
  context "post show" do
    it "should sucess" do
      get :index
      expect(response).to have_http_status 200
    end
  end
end
