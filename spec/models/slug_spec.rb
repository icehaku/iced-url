require 'rails_helper'

RSpec.describe Slug, type: :model do
  describe "Should Respond" do
    it { should respond_to :short_url }
    it { should respond_to :target_url }
  end

  describe "Associations" do
    it { should have_many(:clicks) }
  end

  describe "Factory" do
    let(:http_response) {double("response", code: 200)}

    before { allow(HTTParty).to receive(:get).and_return(http_response) }

    it { expect(build :slug).to be_a Slug }
    it { expect(build :slug).to be_valid }
  end
end
