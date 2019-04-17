require 'caesar_cipher.rb'

describe "#caesar_cipher" do
  context "given an empty string" do
    it "returns nil" do
      expect(caesar_cipher("")).to eql(nil)
    end
  end

  context "given a shift outside (0..25)" do
    it "returns nil" do
      expect(caesar_cipher("test", -1)).to eql(nil)
    end
  end

  context "lowercase" do
    it "shifts correctly" do
      expect(caesar_cipher("abcd", 3)).to eql("defg")
    end
  end

  context "uppercase" do
    it "shifts correctly" do
      expect(caesar_cipher("ABCD", 4)).to eql("EFGH")
    end
  end

  context "shifting from z to a" do
    it "shifts correctly" do
      expect(caesar_cipher("zzZZ", 2)).to eql("bbBB")
    end
  end
end
