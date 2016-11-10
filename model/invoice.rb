require "./db/database"

class Invoice

  attr_reader :item, :contact_id, :var_number
  attr_accessor :invoice_id

  def initialize(item_id, contact_id, var_number)
    @item_id = item_id
    @contact_id = contact_id
    @var_number = var_number
  end

  def ==(obj)
    if invoice_id == obj.invoice_id
      true
    else
      false
    end
  end

  def self.destroy(id)
    data = self.all
    data.delete(self.find(id))
    save_invoices = Database.send((self.to_s + 'Save').snake_case, data)
  end

  def self.find(id)
    read_invoices = self.all
    read_invoices.find do |invoice|
      invoice.invoice_id == id
    end
  end

  def save
    read_invoices = self.class.all
    invoice_ids = read_invoices.map { |invoice| invoice.invoice_id}
    generate_id = rand(100)
    invoice_ids.each do |id|
      if generate_id == id
        generate_id = rand(100)
      end
    end
    self.invoice_id = generate_id
    read_invoices = self.class.all << self
    save_invoices = Database.send((self.class.to_s + 'Save').snake_case, read_invoices)
  end

  def self.all
    read_invoices = Database.send((self.to_s).snake_case)
  end
end

class String
  def snake_case
    return downcase if match(/\A[A-Z]+\z/)
    gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').
    gsub(/([a-z])([A-Z])/, '\1_\2').
    downcase
  end
end
