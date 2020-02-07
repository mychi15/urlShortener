require 'rails_helper'

RSpec.describe ShortenedUrlsController, type: :controller do
  describe "GET #show/:id" do
    it "renders the show template" do
      link = ShortenedUrl.create!(long_url: 'www.hi.com')
      get :show, id: link.id
      expect(response).to render_template(:show)
    end

    context "if shortened_url is invalid" do
      it "does not render show template" do
        begin
          get :show, id: -1
        rescue
          ActiveRecord::RecordNotFound
        end

        expect(response).not_to render_template(:show)
      end
    end
  end

  describe "POST #create" do
    it "renders the show template" do
      post :create, shortened_url: {long_url: 'www.hoohaa.com'}
      expect(response).to redirect_to(shortened_url_path(ShortenedUrl.find_by(long_url: 'www.hoohaa.com')))
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
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
