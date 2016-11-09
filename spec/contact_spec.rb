require './model/contact.rb'

RSpec.describe Contact do
  describe ' #== ' do
    it 'true if contacts id are the same' do
      contact_1 = Contact.new('Contact', 123, "CR")
      contact_1.contact_id = 1
      contact_2 = Contact.new('Contact', 123, "CR")
      contact_2.contact_id = 1

      expect(contact_1 == contact_2).to eq true
    end

    it 'false if contacts id are diferent' do
      contact_1 = Contact.new('Contact', 123, "CR")
      contact_1.contact_id = 5
      contact_2 = Contact.new('Contact', 123, "CR")
      contact_2.contact_id = 7

      expect(contact_1 == contact_2).to eq false
    end
  end
end
