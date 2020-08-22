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

  describe "GET new" do
    it "renders template :new" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "responds to html by default" do
        plant_attributes = FactoryBot.attributes_for(:plant)
        post :create, params: { plant: plant_attributes }
        expect(response.content_type).to eq "text/html; charset=utf-8"
      end

      it "creates a new plant" do
        expect {
          plant_attributes = FactoryBot.attributes_for(:plant)
          post :create, params: { plant: plant_attributes }
        }.to change(Plant, :count).by(1)
      end

      it "redirects to the new plant" do
        plant_attributes = FactoryBot.attributes_for(:plant)
        post :create, params: { plant: plant_attributes }
        expect(response).to redirect_to Plant.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new plant" do
        expect {
          plant_attributes = FactoryBot.attributes_for(:plant, :invalid)
          post :create, params: { plant: plant_attributes }
        }.to_not change(Plant, :count)
      end

      it "re-renders the new method" do
        plant_attributes = FactoryBot.attributes_for(:plant, :invalid)
        post :create, params: { plant: plant_attributes }
        expect(response).to render_template :new
      end
    end
  end
end
