require "./db/database"
require "csv"
require "./model/purchase_invoice.rb"
require "./model/sales_invoice.rb"
require "./model/item.rb"

class Contact

  attr_reader :name, :phone, :state
  attr_accessor :contact_id

  def initialize(name, phone, state)
    @name = name
    @phone = phone
    @state = state
  end

  def ==(obj)
    if contact_id == obj.contact_id
      true
    else
      false
    end
  end

  def self.destroy(id)
    data = Database.contacts
    data.delete(Contact.find(id))
    save_contacts = Database.contact_save(data)
  end

  def self.find(id)
    read_contacts = Database.contacts
    read_contacts.find do |contact|
      contact.contact_id == id
    end
  end

  def save
    read_contacts = Database.contacts
    contact_ids = read_contacts.map { |id| id.contact_id}
    generate_id = rand(100)
    contact_ids.each do |id|
      if generate_id == id
        generate_id = rand(100)
      end
    end
    self.contact_id = generate_id
    read_contacts = Database.contacts << self
    save_contacts = Database.contact_save(read_contacts)
  end

  def self.all
    read_contacts = Database.contacts
  end
end
