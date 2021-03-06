require "pstore"

class Database

  def self.sales_invoice
    invoices_data = PStore.new("./db/database")
    invoices_data.transaction(true) do
      invoices_data[:sales_invoice_data_index] || []
    end
  end

  def self.sales_invoice_save(invoices)
    invoices_data = PStore.new("./db/database")
    invoices_data.transaction do
      invoices_data[:sales_invoice_data_index] = invoices
    end
  end

  def self.purchase_invoice
    invoices_data = PStore.new("./db/database")
    invoices_data.transaction(true) do
      invoices_data[:purchase_invoice_data_index] || []
    end
  end

  def self.purchase_invoice_save(invoices)
    invoices_data = PStore.new("./db/database")
    invoices_data.transaction do
      invoices_data[:purchase_invoice_data_index] = invoices
    end
  end

  def self.contacts
    contacts_data = PStore.new("./db/database")
    contacts_data.transaction(true) do
      contacts_data[:contacts_data_index] || []
    end
  end

  def self.contact_save(contacts)
    contacts_data = PStore.new("./db/database")
    contacts_data.transaction do
      contacts_data[:contacts_data_index] = contacts
    end
  end

  def self.items
    items_data = PStore.new("./db/database")
    items_data.transaction(true) do
      items_data[:items_data_index] || []
    end
  end

  def self.item_save(items)
    items_data = PStore.new("./db/database")
    items_data.transaction do
      items_data[:items_data_index] = items
    end
  end
end
