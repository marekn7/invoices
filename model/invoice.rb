require "./db/database"

class Invoice

  attr_reader :invoice_id, :item, :contact_id, :var_number, :dic_number

  def initialize(item_id, contact_id, var_number, dic_number)
    @invoice_id = automatic_generate_id
    @item_id = item_id
    @contact_id = contact_id
    @var_number = var_number
    @dic_number = dic_number
  end

  def automatic_generate_id
    read_invoices = Database.sales_invoices
    read_invoices.map { |id| id.invoice_id}
    generate_id = rand(100)
    read_invoices.each do |id|
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
    read_invoices = Database.sales_invoices << self
    save_invoices = Database.sales_invoice_save(read_invoices)
  end

  def self.all
    read_invoices = Database.sales_invoices
  end
end
