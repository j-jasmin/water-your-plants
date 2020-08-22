require "rails_helper"
require_relative "../support/devise"

RSpec.describe FertilizingEventsController, type: :controller do
  describe "POST create" do
    before do
      login_as(FactoryBot.create(:user))
      @plant = FactoryBot.build(:plant)
      @plant.update_attribute(:id, 7)
    end
    context "with valid attributes" do
      it "responds to html by default" do
        fertilizing_event_attributes = FactoryBot.attributes_for(:fertilizing_event)
        post :create, params: { fertilizing_event: fertilizing_event_attributes }
        expect(response.content_type).to eq "text/html; charset=utf-8"
      end
    end

      # it "creates a new fertilizing event" do
      #   expect {
      #     fertilizing_event_attributes = FactoryBot.attributes_for(:fertilizing_event)
      #     post :create, params: { fertilizing_event: fertilizing_event_attributes }
      #   }.to change(FertilizingEvent, :count).by(1)
      # end

    #   it "redirects to the new fertilizing event" do
    #     fertilizing_event_attributes = FactoryBot.attributes_for(:fertilizing_event)
    #     post :create, params: { fertilizing_event: fertilizing_event_attributes }
    #     expect(response).to redirect_to Plant.last
    #   end
    # end

    context "with invalid attributes" do
      it "does not save the new fertilizing event" do
        expect {
          fertilizing_event_attributes = FactoryBot.attributes_for(:fertilizing_event, :invalid)
          post :create, params: { fertilizing_event: fertilizing_event_attributes }
        }.to_not change(FertilizingEvent, :count)
      end
    end

    #   it "re-renders the new method" do
    #     login_user
    #     fertilizing_event_attributes = FactoryBot.attributes_for(:fertilizing_event, :invalid)
    #     post :create, params: { fertilizing_event: fertilizing_event_attributes }
    #     expect(response).to render_template :new
    #   end
    # end
  end
end
