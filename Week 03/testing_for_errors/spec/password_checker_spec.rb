require "password_checker.rb"

RSpec.describe PasswordChecker do
  describe "#check" do
    context "when password less than 8" do
      it "fails with message" do
        password_checker = PasswordChecker.new
        expect{ password_checker.check("34fgd") }.to raise_error "Invalid password, must be 8+ characters."
      end
    end

    context "when password is equal to 8 characters" do
      it "returns true" do
        password_checker = PasswordChecker.new
        expect(password_checker.check("thiscool")).to eq true
      end
    end

    context "when password is greater than 8 characters" do
      it "returns true" do
        password_checker = PasswordChecker.new
        expect(password_checker.check("thisiscoolman123@")).to eq true
      end
    end
  end
end
