require 'rails_helper'

RSpec.describe BranchesController, type: :controller do
  branch = FactoryGirl.create(:branch)
  login_user

  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "assigns a new Branch to @branch" do
      get :new
      expect(assigns(:branch)).to be_a_new(Branch)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new branch in the database" do
        expect {
          post :create, branch: FactoryGirl.attributes_for(:branch)
        }.to change(Branch, :count).by(1)
      end

      it "redirects to the index page" do
        post :create, branch: FactoryGirl.attributes_for(:branch)
        expect(response).to redirect_to branches_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new branch in the database" do
        expect {
          post :create, branch: FactoryGirl.attributes_for(:invalid_branch)
        }.to_not change(Branch, :count)
      end

      it "re-renders the :new template" do
        post :create, branch: FactoryGirl.attributes_for(:invalid_branch)
        expect(response).to render_template :new
      end
    end
  end
end
