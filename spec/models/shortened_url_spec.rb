require 'rails_helper'

RSpec.describe ShortenedUrl, type: :model do
  describe "valdations" do
    it {should validate_presence_of(:long_url)}
  end

  describe "class methods" do
    describe "::generate_token" do
        it "should return a unique token" do
          before { allow(SecureRandom).to receive(:hex).with(3).and_return('abc123') }
          (generate_token).should_not equal('abc123')
        end
    end
  end
end
