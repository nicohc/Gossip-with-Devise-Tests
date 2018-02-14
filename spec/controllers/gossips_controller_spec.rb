require 'rails_helper'

RSpec.describe GossipsController, type: :controller do

=begin
  describe "GET #new" do
    it "returns http success" do
      user = User.create(anonymous_username:'jeanmichel3', password:'bonjour', email:'jmlebg@gossip.fr').save
      user_signed_in
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end
=end
end
