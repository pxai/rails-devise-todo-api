require "rails_helper"

RSpec.describe HomeController, type: :controller do
  before do
    get "/"
  end

  # it "should return 200:OK" do
  #   expect(response).to have_http_status(:success)
  # end
end