require "spec_helper"
require "support/webmocks/allocations"

RSpec.describe Electio::Account, type: :request do
  describe "Creating new allocation with default rules" do
    before do
      authenticate
      create_allocation
    end

    let(:allocation) { JSON.load(File.read("spec/fixtures/create_allocation.json")) }

    subject do 
      Electio::Allocation.new(allocation).save
    end

    it "should return 200 with the relation body" do
      expect(subject.status_code).to eq(200)
      expect(subject).to be_an(Object)
    end
  end
end