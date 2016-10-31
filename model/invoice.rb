require "./db/database"

class Invoice

  attr_reader :number, :item, :contact_id, :var_number, :dic_number

  def initialize(invoice_id, item_id, contact_id, var_number, dic_number)
    @invoice_id = invoice_id
    @item_id = item_id
    @contact_id = contact_id
    @var_number = var_number
    @dic_number = dic_number
  end

  def save
    read_invoices = Database.sales_invoices << self
    save_invoices = Database.sales_invoice_save(read_invoices)
  end

  def self.all
    read_invoices = Database.sales_invoices
  end
end
