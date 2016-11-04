require "./db/database"

class Invoice

  attr_reader :item, :contact_id, :var_number, :dic_number
  attr_accessor :invoice_id

  def initialize(item_id, contact_id, var_number, dic_number)
    @item_id = item_id
    @contact_id = contact_id
    @var_number = var_number
    @dic_number = dic_number
  end

  def ==(obj)
    if invoice_id == obj.invoice_id
      true
    else
      false
    end
  end

  def self.destroy(id)
    data = Database.sales_invoices
    data.delete(Invoice.find(id))
    save_invoices = Database.sales_invoice_save(data)
  end

  def self.find(id)
    read_invoices = Database.sales_invoices
    read_invoices.find do |invoice|
      invoice.invoice_id == id
    end
  end

  def save
    read_invoices = Database.sales_invoices
    invoice_ids = read_invoices.map { |invoice| invoice.invoice_id}
    generate_id = rand(100)
    invoice_ids.each do |id|
      if generate_id == id
        generate_id = rand(100)
      end
    end
    self.invoice_id = generate_id
    read_invoices = Database.sales_invoices << self
    save_invoices = Database.sales_invoice_save(read_invoices)
  end

  def self.all
    read_invoices = Database.sales_invoices
  end
end
