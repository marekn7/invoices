require "./db/database"

RSpec.describe Database do
  describe 'read and save from database' do
    it '#sales_invoice' do
      File.open('./db/database', 'w') {|file| file.truncate(0) }
      data = PStore.new("./db/database")
      data.transaction do
        data[:sales_invoice_data_index] = [[1, 'invoice sales', 123]]
      end

      database = Database.sales_invoice

      expect(database).to eq [[1, 'invoice sales', 123]]
      File.open('./db/database', 'w') {|file| file.truncate(0) }
    end

    it '#sales_invoice_save' do
      database = Database.sales_invoice_save([[2, 'invoice sales', 345]])

      expect(database).to eq [[2, 'invoice sales', 345]]
      File.open('./db/database', 'w') {|file| file.truncate(0) }
    end

    it '#purchase_invoice' do
      data = PStore.new("./db/database")
      data.transaction do
        data[:purchase_invoice_data_index] = [[1, 'purchase sales', 123]]
      end

      database = Database.purchase_invoice

      expect(database).to eq [[1, 'purchase sales', 123]]
      File.open('./db/database', 'w') {|file| file.truncate(0) }
    end

    it '#purchase_invoice_save' do
      database = Database.purchase_invoice_save([1, 'purchase sales', 456])

      expect(database).to eq [1, 'purchase sales', 456]
      File.open('./db/database', 'w') {|file| file.truncate(0) }
    end
  end
end
