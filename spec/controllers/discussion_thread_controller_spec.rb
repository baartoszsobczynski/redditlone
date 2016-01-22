require 'rails_helper'

RSpec.describe DiscussionThreadController, :type => :controller do

  describe "GET #index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns discussion threads" do
      discussion_thread = DiscussionThread.create
      get :index
      expect(assigns(:discussion_threads)).to eq([discussion_thread])
    end
  end
end
