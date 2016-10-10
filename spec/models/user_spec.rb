require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar") }

  describe "User has readable attributes" do
    it "name" do
      expect(user.name).to eq("Example User")
    end
    it "email" do
      expect(user.email).to eq("user@example.com")
    end
  end

  describe "#email" do
    it "should not be valid when not filled in" do
      user.email = ' ' #invalid state
      expect(user).to_not be_valid
      # expect(record.errors[:email]).to eq(["can't be blank"])
    end
    it "should be valid when filled in" do
      user.email = "user@example.com" #valid state
      expect(user).to be_valid
    end
    it "should not be too long" do
      user.email = "a" * 250 + "@example.com" #invalid state
      expect(user).to_not be_valid
    end
    it "should accept valid email formats" do
      valid_addresses = ["user@example.com", "USER@foo.C", "first.last@foo.jp", "alice+bob@baz.cn"]
      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
    it "should not accept invalid email formats" do
      invalid_addresses = ["user@example,com", "user_at_foo.org", "user.name@example.",
                           "foo@bar_baz.com", "foo@bar+baz.com"]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).to_not be_valid
      end
    end
    it "should save as downcase" do
      mixed_case_email = "Foo@ExAMPLe.CoM"
      user.email = mixed_case_email
      user.save
      expect(user.email).to eq("foo@example.com")
    end
  end

  describe "#name" do
    it "should not be valid when not filled in" do
      user.name = ' ' #invalid state
      expect(user).to_not be_valid
      expect(user.errors[:name]).to eq(["can't be blank"])
    end
    it "should be valid when filled in" do
      user.name = "Example User" #valid state
      expect(user).to be_valid
    end
    it "should not be too long" do
      user.name = "a" * 51
      expect(user).to_not be_valid
    end
  end

  describe "#password" do
    it "should be present" do
      user.password = ""
      user.password_confirmation = ""
      expect(user).to_not be_valid
    end
    it "should have a minimum length" do
      user.password = "aaaaa"
      user.password_confirmation = "aaaaa"
      expect(user).to_not be_valid
    end
  end

end
