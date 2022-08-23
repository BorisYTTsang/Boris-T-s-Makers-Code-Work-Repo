require "present.rb"

RSpec.describe Present do
  describe "#wrap" do
    context "when no contents wrapped yet" do
      it "wraps contents" do
        present = Present.new
        expect( present.wrap("RC car") ).to eq "RC car"
      end
    end

    context "when contents wrapped already" do
      it "fails" do
        present = Present.new
        present.wrap("RC car")
        expect{ present.wrap("Screwball Scramble") }.to raise_error "A contents has already been wrapped."
      end
    end
  end

  describe "#unwrap" do
    context "when no contents wrapped yet" do
      it "fails" do
        present = Present.new
        expect{ present.unwrap }.to raise_error "No contents have been wrapped."
      end
    end

    context "when contents wrapped already" do
      it "returns unwrapped contents" do
        present = Present.new
        present.wrap("RC car")
        expect( present.unwrap ).to eq "RC car"
      end
    end
  end
end
