require "./db/database"

class Item

  attr_reader :item_id, :name, :subject

  def initialize(name, subject)
    @item_id = automatic_generate_id
    @name = name
    @subject = subject
  end

  def automatic_generate_id
    read_items = Database.items
    read_items.map { |id| id.contact_id}
    generate_id = rand(100)
    read_items.each do |id|
      if generate_id == id
        generate_id = rand(100)
      end
    end
    generate_id
  end

  def destroy
  end

  def self.find
  end

  def save
    read_items = Database.items << self
    save_items = Database.item_save(read_items)
  end

  def self.all
    read_items = Database.items
  end
end
