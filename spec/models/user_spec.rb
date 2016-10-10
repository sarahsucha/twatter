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

  describe "#email" do
    it "should not be valid when not filled in" do
      record = User.new
      record.email = ' ' #invalid state
      record.name = 'Example User'
      expect(record).to_not be_valid
      # expect(record.errors[:email]).to eq(["can't be blank"])
    end
    it "should be valid when filled in" do
      record = User.new
      record.email = "user@example.com" #valid state
      record.name = 'Example User'
      expect(record).to be_valid
    end
    it "should not be too long" do
      record = User.new
      record.email = "a" * 250 + "@example.com" #invalid state
      record.name = 'Example User'
      expect(record).to_not be_valid
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
      record = User.new
      record.name = ' ' #invalid state
      record.email = "user@example.com"
      expect(record).to_not be_valid
      expect(record.errors[:name]).to eq(["can't be blank"])
    end
    it "should be valid when filled in" do
      record = User.new
      record.name = "Example User" #valid state
      record.email = "user@example.com"
      expect(record).to be_valid
    end
    it "should not be too long" do
      record = User.new
      record.name = "a" * 51
      record.email = "user@example.com"
      expect(record).to_not be_valid
    end
  end

end
