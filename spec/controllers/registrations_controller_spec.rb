require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  registration = FactoryGirl.create(:registration)

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "assigns a new Registration to @registration" do
      get :new
      expect(assigns(:registration)).to be_a_new(Registration)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new registration in the database" do
        expect {
          post :create, registration: FactoryGirl.attributes_for(:registration)
        }.to change(Registration, :count).by(1)
      end

      it "redirects to the index page" do
        post :create, registration: FactoryGirl.attributes_for(:registration)
        expect(response).to redirect_to registrations_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new registration in the database" do
        expect {
          post :create, registration: FactoryGirl.attributes_for(:invalid_registration)
        }.to_not change(Registration, :count)
      end

      it "re-renders the :new template" do
        post :create, registration: FactoryGirl.attributes_for(:invalid_registration)
        expect(response).to render_template :index
      end
    end
  end
end
