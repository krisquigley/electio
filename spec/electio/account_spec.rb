require "spec_helper"
require "support/webmocks/accounts"

RSpec.describe Electio::Account, type: :request do
  describe "Creating new account" do
    before do
      authenticate
      create_account
    end

    let(:account) { JSON.load(File.read("spec/fixtures/create_account.json")) }

    subject do 
      Electio::Account.new(account).save
    end

    it "should return 201 with the relation body" do
      expect(subject.status_code).to eq(201)
      expect(subject).to be_an(Object)
    end
  end

  describe "Querying an account by email address" do
    before do
      authenticate
      find_account
    end

    let(:account) { "person@domain.com" }

    subject do 
      Electio::Account.find(account)
    end

    it "should return 201 with the relation body" do
      expect(subject.status_code).to eq(200)
      expect(subject).to be_an(Object)
    end
  end

  describe "Querying an account by reference" do
    before do
      authenticate
      find_reference_account
    end

    let(:account) { "abcda6ef-a56f-4dea-825c-8bcb201a3714" }

    subject do 
      Electio::Account.find(account)
    end

    it "should return 201 with the relation body" do
      expect(subject.status_code).to eq(200)
      expect(subject).to be_an(Object)
    end
  end
end