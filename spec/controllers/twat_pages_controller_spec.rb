require 'rails_helper'

describe TwatPagesController do

  describe "GET #home" do
    it "responds with status code 200" do
      get :home
      expect(response).to have_http_status 200
    end

    it "renders the :home template" do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe "GET #help" do
    it "responds with status code 200" do
      get :help
      expect(response).to have_http_status 200
    end

    it "renders the :help template" do
      get :help
      expect(response).to render_template(:help)
    end
  end

  describe "GET #about" do
    it "responds with status code 200" do
      get :about
      expect(response).to have_http_status 200
    end

    it "renders the :about template" do
      get :about
      expect(response).to render_template(:about)
    end
  end

end
