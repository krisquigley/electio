require "spec_helper"
require "support/webmocks/carriers"

RSpec.describe Electio::Carrier, type: :request do
  describe "Getting all carriers" do
    before do
      authenticate
      get_carriers
    end

    subject do 
      Electio::Carrier.all
    end

    it "should return 200 with the relation body" do
      expect(subject.status_code).to eq(200)
      expect(subject).to be_an(Object)
    end
  end
end