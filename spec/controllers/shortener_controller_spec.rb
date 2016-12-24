require 'rails_helper'

RSpec.describe ShortenerController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http bad_request with no params" do
      post :create
      expect(response).to have_http_status(400)
    end

    context "with proper params" do
      before do
        post :create, params: { link:{original_url: 'http://google.com'} }
      end
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
      it "assigns short url" do
        expect(assigns(:short_url)).to_not be_nil
      end
    end
  end

  describe "GET #redirect" do
    context "with correct hash" do
      before { @link = Link.create(original_url:'google.com') }
      it "should redirect to original_url" do
        hash = Hasher.new.encode(@link.id)
        get :redirect, params: { hash_id: hash }
        expect(response).to redirect_to 'http://google.com'
      end
    end
    context "with incorrect hash" do
      it "should redirect to root" do
        get :redirect, params: {hash_id: '5ZjJwE'}
        expect(response).to redirect_to root_path
      end
    end
  end

end
