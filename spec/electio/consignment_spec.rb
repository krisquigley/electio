require "spec_helper"
require "support/webmocks/consignments"

RSpec.describe Electio::Consignment, type: :request do
  describe "Creating new consignment" do
    before do
      authenticate
      create_consignment
    end

    let(:consignment) { JSON.load(File.read("spec/fixtures/create_consignment.json")) }

    subject do 
      Electio::Consignment.new(consignment).save
    end

    it "should return 201 with the relation body" do
      expect(subject.status_code).to eq(201)
      expect(subject).to be_an(Object)
    end
  end

  describe "Querying a consignment" do
    before do
      authenticate
      find_consignment
    end

    let(:consignment) { "EC-000-0MS-MJE" }

    subject do 
      Electio::Consignment.find(consignment)
    end

    it "should return 201 with the relation body" do
      expect(subject.status_code).to eq(200)
      expect(subject).to be_an(Object)
    end
  end
end