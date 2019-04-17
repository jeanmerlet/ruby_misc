require 'enumerable.rb'

describe Enumerable do
  let(:array) { [1, 2, 3, "cat", :meow] }

  describe '#my_each' do
    context "called by a non-enumerable object" do
      it "raises a 'NoMethodError' error" do
        expect { 5.my_each }.to raise_error(NoMethodError)
      end
    end

    context "called by an empty array" do
      it "returns the empty array" do
        expect([].my_each).to eql([])
      end
    end

    context "called by a non-empty array" do
      context "no block is given" do
        it "returns self" do
          expect(array.my_each).to eql(array)
        end
      end

      context "a block is given" do
        context "the block is empty" do
          it "returns self" do
            expect(array.my_each {}).to eql(array)
          end
        end

        context "the block is not empty" do
          it "invokes the yield statement" do
            expect { |b| array.my_each(&b) }.to yield_control
          end
        end
      end
    end
  end

  describe '#my_select' do
    context "given a block that evaluates to false" do
      it "returns an empty array" do
        expect(array.my_select { false }).to eql([])
      end
    end

    context "given a block that evaluates to true" do
      it "returns the array it is called on" do
        expect(array.my_select { true }).to eql(array)
      end
    end
  end

  describe '#my_all??' do
    context "no block is given" do
      it "evaluates each element of the collection it is called on" do
        expect(array.my_all?).to eql(true)
      end
    end

    context "a block is given" do
      context "the block evaluates to false" do
        it "returns false" do
          expect(array.my_all? { false }).to eql(false)
        end
      end

      context "the block evaluates to true" do
        it "returns true" do
          expect(array.my_all? { true }).to eql(true)
        end
      end
    end
  end

  describe '#my_count' do
    context "it is called on an empty array" do
      it "returns 0" do
        expect([].my_count).to eql(0)
      end
    end

    context "it is called on a non-empty array" do
      context "the block evaluates to true" do
        it "returns the size of the array" do
          expect(array.my_count { true } ).to eql(5)
        end
      end
    end
  end
end
