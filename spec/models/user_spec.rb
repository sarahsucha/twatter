require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: "Example User", email: "user@example.com") }

  describe "User has readable attributes" do
    it "name" do
      expect(user.name).to eq("Example User")
    end
    it "email" do
      expect(user.email).to eq("user@example.com")
    end
  end
end
