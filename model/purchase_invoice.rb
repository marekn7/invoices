require "./model/invoice.rb"

class PurchaseInvoice < Invoice

  def seller_id
    contact_id
  end

  def seller_id=(seller_id)
    @contact_id = seller_id
  end
end
