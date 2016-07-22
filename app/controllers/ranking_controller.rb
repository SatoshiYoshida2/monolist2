class RankingController < ApplicationController
  def have
    # item_keys = Have.group(:item_id).order('count_all desc').limit(10).count.keys
    # @items = Item.where(id: item_keys).sort_by{|o| item_keys.index(o.id)}
    @items = Have.rank10_items
  end

  def want
    # item_keys = Want.group(:item_id).order('count_all desc').limit(10).count.keys
    # @items = Item.where(id: item_keys).sort_by{|o| item_keys.index(o.id)}
    @items = Want.rank10_items
  end
end
