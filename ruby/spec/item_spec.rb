require 'item'

describe ItemCreation do

  subject(:item) { described_class.new(name, sell_in, quality) }

    describe "#initialize" do
      it 'initializes with a name, sell-in and quality' do
        item = ItemCreation.new("sword", 5, 6)
        expect(item.name).to eq("sword")
        expect(item.sell_in).to eq(5)
        expect(item.quality).to eq(6)
    end
  end

    describe "When I want to print out the item" do
      it 'is possible by using the to_s method' do
        item = ItemCreation.new("sword", 5, 6)
        expect(item.to_s()).to eq("sword, 5, 6")
    end
  end
end
