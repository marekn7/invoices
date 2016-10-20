require "pstore"

class Database

  def self.sales_invoice
    invoices_data = PStore.new("database_pstore")
    invoices_data.transaction(true) do
      invoices_data[:invoices_data_index]
    end
  end

  def self.sales_invoice_save(invoices)
    invoices_data = PStore.new("database_pstore")
    invoices_data.transaction do
      invoices_data[:invoices_data_index] = invoices
    end
  end
end
