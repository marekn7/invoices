require "./db/database"

class Item

  attr_reader :item_id, :name, :subject

  def initialize(item_id, name, subject)
    @item_id = item_id
    @name = name
    @subject = subject
  end

  def save
    read_items = [Database.item, self]
    save_items = Database.item_save(read_items)
  end
end
