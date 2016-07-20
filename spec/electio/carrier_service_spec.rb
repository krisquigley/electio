require "spec_helper"
require "support/webmocks/carrier_services"

RSpec.describe Electio::CarrierService, type: :request do
  describe "Getting all carrier services" do
    before do
      authenticate
      get_carrier_services
    end

    subject do 
      Electio::CarrierService.all
    end

    it "should return 200 with the relation body" do
      expect(subject.status_code).to eq(200)
      expect(subject).to be_an(Object)
    end
  end
end