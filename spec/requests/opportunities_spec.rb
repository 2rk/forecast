require 'spec_helper'

RSpec.describe "Opportunities", :type => :request do
  describe "GET /opportunities" do
    it "works! (now write some real specs)" do
      get opportunities_path
      expect(response.status).to be(200)
    end
  end
end
