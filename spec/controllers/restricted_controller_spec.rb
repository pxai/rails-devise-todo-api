require "rails_helper"

RSpec.describe RestrictedController, type: :controller do
  describe "GET /restricted" do
    let(:valid_session) { {} }

    context "from login user" do
      # it "should return 200:OK" do
      #   get :restricted, {format: :json, session: valid_session}
      #   expect(response).to have_http_status(:success)
      #   #expect(response).to be_successful 
      # end
    end
  end
end