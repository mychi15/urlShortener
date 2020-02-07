require 'rails_helper'

RSpec.describe ShortenedUrlsController, type: :controller do
  describe "GET #index" do
    it "renders the shortened_urls index" do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      build(:shortened_url)
      get :show
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "renders the new template"
    end

    context "with valid params" do
      it "renders the show template"
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end

  describe "DELETE #destroy" do
    context "unsuccesful deletion" do
      it "raises error for invalid id" do
        bypass_rescue
        expect { delete :destroy, id: 100000 }.to raise_error(ActiveRecord::RecordNotFound)
        expect(response).to have_http_status(404)
      end
    end

    context "successful deletion" do
      it "renders new template" do
        delete :destroy
        expect(response).to be_success
        expect(response).to render_template(:new)
      end
    end
  end
end
