require "rails_helper"
require_relative "../support/devise"

RSpec.describe PlantsController, type: :controller do
  describe "GET index" do
    login_user

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders template :index" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
