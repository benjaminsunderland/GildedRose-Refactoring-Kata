class GildedRose

  attr_accessor :items, :special_items


  def initialize(items)
    @special_items = ["Aged Brie", "Sulfuras, Hand of Ragnaros", "Backstage passes to a TAFKAL80ETC concert"]
    @items = items
  end

  def quality_degrade
    item.quality > 0 ? item.quality = item.quality - 1 : item.quality
  end


end
