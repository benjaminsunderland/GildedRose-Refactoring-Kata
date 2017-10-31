class GildedRose

  attr_accessor :items

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert" #if item name is not aged bri and concert ticket
        if item.quality > 0 #If item quality is bigger more than 0
          if item.name != "Sulfuras, Hand of Ragnaros" #And it isn't named Sulfuras, Hand of Ragnaros
            item.quality = item.quality - 1 #We decrease the quality by 1
          end
        end
      else
        if item.quality < 50 #if the item quality is less than 50
          item.quality = item.quality + 1 #we increase the quality by 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"#if item is the concert ticket
            if item.sell_in < 11#and if the item's sell in value is less than 11
              if item.quality < 50#and if the quality is less than 50
                item.quality = item.quality + 1#we should increase it by 1
              end
            end
            if item.sell_in < 6 #if the item's sell_in is less than 6
              if item.quality < 50#and if the quality is less than 50
                item.quality = item.quality + 1 #we increase the quality by 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros" #if item is not equal to sulfuras
        item.sell_in = item.sell_in - 1#we should delete a value of 1 from it
      end
      if item.sell_in < 0#if the item sell_in is less than 0
        if item.name != "Aged Brie"#if item is not named aged brie
          if item.name != "Backstage passes to a TAFKAL80ETC concert"#if item is not named the concert
            if item.quality > 0#if the item quality is more than 0
              if item.name != "Sulfuras, Hand of Ragnaros"#if the item name is not sulfuras
                item.quality = item.quality - 1#we delete a 1 from the quality
              end
            end
          else#otherwise
            item.quality = item.quality - item.quality#.....
          end
        else
          if item.quality < 50#if the quality is over 50
            item.quality = item.quality + 1#we add one to the quality
          end
        end
      end
    end
  end

  def sulfuras
    if item.quality > 0
    if item.name != "Sulfuras, Hand of Ragnaros"
      item.quality = item.quality - 1
    end
    if item.name != "Sulfuras, Hand of Ragnaros"
      item.sell_in = item.sell_in - 1
    end
    if item.sell_in < 0
    if item.name != "Sulfuras, Hand of Ragnaros"
      item.quality = item.quality - 1
    end
  end
end
