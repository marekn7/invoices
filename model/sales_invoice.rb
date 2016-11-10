require "./model/invoice.rb"

class SalesInvoice < Invoice

  def buyer_id
    contact_id
  end

  def buyer_id=(buyer_id)
    @contact_id = seller_id
  end
end
