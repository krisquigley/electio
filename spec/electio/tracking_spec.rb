require "spec_helper"
require "support/webmocks/trackings"

RSpec.describe Electio::Tracking, type: :request do
  before do
    authenticate
    find_tracking_details
  end

  describe "Find tracking details by client reference" do
    subject do 
      Electio::Tracking.find_by(client_reference: "test-client")
    end

    it "should return 200 with the relation body" do
      expect(subject.status_code).to eq(200)
      expect(subject).to be_an(Object)
    end
  end

  describe "Find tracking details by consignment reference" do
    subject do 
      Electio::Tracking.find_by(consignment_reference: "EC-098-023-D3E")
    end

    it "should return 200 with the relation body" do
      expect(subject.status_code).to eq(200)
      expect(subject).to be_an(Object)
    end
  end
end