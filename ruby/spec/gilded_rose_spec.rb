require 'gilded_rose'
require 'item'

describe GildedRose do

  subject(:gildedrose) { described_class.new(items) }
  let(:items) { [ItemCreation.new("fixme", 6, 7),
                 ItemCreation.new("Sword Of Truth", -1, 2 ),
                 ItemCreation.new("golden turnip", 10, 5),
                 ItemCreation.new("Aged Brie", 2, 0),
                 ItemCreation.new("Sulfuras, Hand of Ragnaros", 0, 80),
                 ItemCreation.new("Backstage passes to a TAFKAL80ETC concert", 15, 40),
                 ItemCreation.new("Backstage passes to a TAFKAL80ETC concert", 10, 40),
                 ItemCreation.new("Backstage passes to a TAFKAL80ETC concert", 5, 40),
                 ItemCreation.new("Backstage passes to a TAFKAL80ETC concert", -1, 40),
                 ItemCreation.new("Normal", 0, 5)]}
                 ItemCreation.new("Breastplate Of Righteousness", 5, 51)


  describe "#update_quality" do
    it "does not change the name" do
      gildedrose.update_quality()
      expect(items[0].name).to eq "fixme"
    end
  end

  describe "#items" do
    it "does not change the quality of Sulfuras" do
      gildedrose.update_quality()
      expect(items[4].sell_in).to eq(0)
      expect(items[4].quality).to eq(80)
    end

    it "at the end of the day, it decreases the quality" do
      gildedrose.update_quality()
      expect(items[2].sell_in).to eq(9)
      expect(items[2].quality).to eq(4)
    end

    it "changes the quality twice as fast when it is past sell-date" do
      gildedrose.update_quality()
      expect(items[1].quality).to eq(0)
    end

    it "increases the quality of Aged Brie the older it gets" do
      gildedrose.update_quality()
      expect(items[3].quality).to eq(1)
    end

    it "Backstage increases in quality like brie" do
      gildedrose.update_quality()
      expect(items[5].quality).to eq(41)
    end

    it "Backstage quality increases by two if sell_in <= 10" do
      gildedrose.update_quality()
      expect(items[6].quality).to eq(42)
    end

    it "Backstage quality increases by three if sell_in <= 5" do
      gildedrose.update_quality()
      expect(items[7].quality).to eq(43)
    end

    it "Backstage quality drops to 0 after concert" do
      gildedrose.update_quality()
      expect(items[8].quality).to eq(0)
    end

    it 'is not possible to have a value of over 50 for quality' do
    end

    it 'is not possible for the quality of an item to be negative' do
    end


  end
end
