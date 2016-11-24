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
    end
  end
end
