require "rails_helper"
require_relative "../support/devise"

RSpec.describe PlantsController, type: :controller do
  login_user
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders template :index" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "responds to" do
    it "responds to html by default" do
      post :create, params: { plant: { name: "Monstera" } }
      expect(response.content_type).to eq "text/html; charset=utf-8"
    end
  end
end
