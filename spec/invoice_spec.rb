require './model/invoice.rb'

RSpec.describe Invoice do
  describe ' #== ' do
    it 'true if invoices id are the same' do
      invoice_1 = Invoice.new(20, 1, 123, 1234)
      invoice_1.invoice_id = 1
      invoice_2 = Invoice.new(20, 1, 123, 1234)
      invoice_2.invoice_id = 1

      expect(invoice_1 == invoice_2).to eq true
    end

    it 'false if invoices id are diferent' do
      invoice_1 = Invoice.new(20, 1, 123, 1234)
      invoice_1.invoice_id = 5
      invoice_2 = Invoice.new(1, 1, 1, 1)
      invoice_2.invoice_id = 7

      expect(invoice_1 == invoice_2).to eq false
    end
  end
end
