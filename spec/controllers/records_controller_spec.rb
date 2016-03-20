require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
  record = FactoryGirl.create(:record)

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "assigns a new Record to @record" do
      get :new
      expect(assigns(:record)).to be_a_new(Record)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new record in the database" do
        expect {
          post :create, record: FactoryGirl.attributes_for(:record)
        }.to change(Record, :count).by(1)
      end

      it "redirects to the index page" do
        post :create, record: FactoryGirl.attributes_for(:record)
        expect(response).to redirect_to records_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new record in the database" do
        expect {
          post :create, record: FactoryGirl.attributes_for(:invalid_record)
        }.to_not change(Record, :count)
      end

      it "re-renders the :new template" do
        post :create, record: FactoryGirl.attributes_for(:invalid_record)
        expect(response).to render_template :index
      end
    end
  end
end
