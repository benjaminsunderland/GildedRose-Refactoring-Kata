require 'gilded_rose'
require 'item'

describe GildedRose do

  subject(:gildedrose) { described_class.new(items) }


  describe "#update_quality" do
    it "does not change the name" do
      items = [ItemCreation.new("fixme", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "fixme"
    end
  end

  describe "#items" do
    it "does not change the quality of Sulfuras" do
      items = [ItemCreation.new("Sulfuras, Hand of Ragnaros", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq(0)
      expect(items[0].quality).to eq(0)
    end

    it "changes the quality twice as fast when it is past sell-date" do
      items = [ItemCreation.new("Dagger of Love", -1, 5)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(3)
    end

    it "increases the quality of Aged Brie the older it gets" do
      items = [ItemCreation.new("Aged Brie", 5, 6)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq(7)
    end

    it 'is not possible to have a value of over 50 for quality' do
    end

    it 'is not possible for the quality of an item to be negative' do
    end
  end
end
