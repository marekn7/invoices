require "./database"

class Invoice

  attr_reader :number, :item, :contact_id, :var_number, :dic_number

  def initialize(number, item, contact_id, var_number, dic_number)
    @number = number
    @item = item
    @contact_id = contact_id
    @var_number = var_number
    @dic_number = dic_number
  end

  def save
    read_invoices = [Database.sales_invoice, self]
    save_invoices = Database.sales_invoice_save(read_invoices)
  end
end
