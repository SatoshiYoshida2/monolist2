class Ownership < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :item, class_name: "Item"
  
  def self.rank10_items
    result = group(:item_id).order('count_all desc').limit(10).count
    item_keys = result.keys
    Item.where(id: item_keys).sort_by{|o| item_keys.index(o.id)}
  end
end
