require "spec_helper"

RSpec.describe Electio::Consignment, type: :request do
  describe "Creating new consignment" do
    before do
    end

    subject do 
      consignment = JSON.load(File.open("spec/fixtures/consignment.json", "r"))
      Electio::Consignment.new(consignment)
    end

    it "should return 201 with the relation body" do
      expect(subject.save.status).to eq(201)
      expect(subject.save).to eq {
        {
          links: [
            {
              rel: "detail",
              href: "/v1/consignments/EC-000-0MS-MJE"
            }
          ]
        }
      }
    end
  end
end