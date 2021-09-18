require 'rails_helper'

RSpec.describe Click, type: :model do
  describe "Should Respond" do
   it { should respond_to :remote_ip }
  end

  describe "Associations" do
    it { should belong_to(:slug) }
  end

  describe "Factory" do
    it { expect(build :click).to be_a Click }
    it { expect(build :click).to be_valid }
  end
end
