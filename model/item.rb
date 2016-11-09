require "./db/database"

class Item

  attr_reader :item_id, :name, :subject
  attr_accessor :item_id

  def initialize(name, subject)
    @name = name
    @subject = subject
  end

  def ==(obj)
    if item_id == obj.item_id
      true
    else
      false
    end
  end

  def self.destroy(id)
    data = Database.items
    data.delete(Item.find(id))
    save_items = Database.item_save(data)
  end

  def self.find(id)
    read_items = Database.items
    read_items.find do |item|
      item.item_id == id
    end
  end

  def save
    read_items = Database.items
    item_ids = read_items.map { |item| item.item_id}
    generate_id = rand(100)
    item_ids.each do |id|
      if generate_id == id
        generate_id = rand(100)
      end
    end
    self.item_id = generate_id
    read_items = Database.items << self
    save_items = Database.item_save(read_items)
  end

  def self.all
    read_items = Database.items
  end
end
