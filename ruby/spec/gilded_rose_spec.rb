require 'gilded_rose'
require 'item'

describe GildedRose do

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
  end
end
