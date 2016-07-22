require "spec_helper"
require "support/webmocks/labels"

RSpec.describe Electio::Label, type: :request do
  describe "Find a specific label" do
    before do
      authenticate
      get_labels
    end

    subject do 
      Electio::Label.find("EC-000-0MS-MJE")
    end

    it "should return 200 with the relation body" do
      expect(subject.status_code).to eq(200)
      expect(subject).to be_an(Object)
    end

    it "should return a file" do
      expect(subject.file).to be_an_instance_of(Tempfile)
    end
  end
end