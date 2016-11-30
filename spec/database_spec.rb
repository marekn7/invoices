require "./db/database"

RSpec.describe Database do
  describe 'invoice database' do
    it '#sales_invoice' do
      data = PStore.new("./db/database_sales_invoice")
      data.transaction do
        data[:invoices_data_index] = [[1, 'invoice sales', 123]]
      end

      database = Database.sales_invoice

      expect(database).to eq [[1, 'invoice sales', 123]]
      File.open('./db/database_sales_invoice', 'w') {|file| file.truncate(0) }
    end

    it '#sales_invoice_save' do
      database = Database.sales_invoice_save([[2, 'invoice sales', 345]])

      expect(database).to eq [[2, 'invoice sales', 345]]
      File.open('./db/database_sales_invoice', 'w') {|file| file.truncate(0) }
    end
  end
end
