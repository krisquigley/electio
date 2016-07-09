require "spec_helper"

RSpec.describe Electio::Configuration do
  describe "Setting up config params" do
    before(:each) do
      Electio.configure do |config|
        config.api_key = ENV['API_KEY']
      end
    end

    it "should return the API key value" do
      expect(Electio.configuration.api_key).to eq ENV['API_KEY']
    end
  end
end