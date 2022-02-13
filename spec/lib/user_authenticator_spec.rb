require 'rails_helper'

describe UserAuthenticator do
  context "when initialize with code" do 
    let(:authenticator) { described_class.new(code: 'example') }
    let(:authenticator_class) { UserAuthenticator::Oauth }

    describe "#initialize" do 
      it "should initialize proper authenticator" do 
        expect(authenticator_class).to receive(:new).with('example')
        authenticator
      end
    end
  end

  context "when initialize with login & password" do 
    let(:authenticator) { described_class.new(login: 'jsmith', password: 'secret') }
    let(:authenticator_class) { UserAuthenticator::Standard }

    describe "#initialize" do 
      it "should initialize proper authenticator" do 
        expect(authenticator_class).to receive(:new).with('jsmith', 'secret')
        authenticator
      end

      it "should create and set user's access token" do
        expect{ authenticator.perform }.to change{ AccessToken.count }.by(1)
        expect(authenticator.access_token).to be_present
      end
    end
  end
end