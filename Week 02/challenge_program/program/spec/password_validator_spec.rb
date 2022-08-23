require_relative "../lib/password_validator"

RSpec.describe("password validation") do
  describe("valid?") do

    context("When insufficient number of characters is provided") do
      it("returns false when the password is less than 8 chars") do
        expect(valid?("1234567")).to eq(false)
      end

      it("returns false when the password is more than 8 characters, and contains no special characters") do
        expect(valid?("123456789")).to eq(false)
      end

      it("returns false when the password contains less than eight characters but includes '!'") do
        expect(valid?("567!")).to eq(false)
      end

      it("returns false when the password contains less than eight characters but includes '@'") do
        expect(valid?("567@")).to eq(false)
      end

      it("returns false when the password contains less than eight characters but includes '$'") do
        expect(valid?("567$")).to eq(false)
      end

      it("returns false when the password contains less than eight characters but includes '&'") do
        expect(valid?("567&")).to eq(false)
      end

      it("returns false when the password contains less than eight characters but includes '%'") do
        expect(valid?("567%")).to eq(false)
      end
    end

    context("When sufficient number of characters is provided") do

      it("returns false when the password does not contain any special characters") do
        expect(valid?("12345678")).to eq(false)
      end

      it("returns true when the password contains eight characters including '!'") do
        expect(valid?("1234567!")).to eq(true)
      end

      it("returns true when the password contains eight characters including '@'") do
        expect(valid?("1234567@")).to eq(true)
      end

      it("returns true when the password contains eight characters including '$'") do
        expect(valid?("1234567$")).to eq(true)
      end

      it("returns true when the password contains eight characters including '%'") do
        expect(valid?("1234567%")).to eq(true)
      end

      it("returns true when the password contains eight characters including '&'") do
        expect(valid?("1234567&")).to eq(true)
      end
    end
  end
end
