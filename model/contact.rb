require "./db/database"

class Contact

  attr_reader :contact_id, :name, :subject, :state

  def initialize(contact_id, name, subject, state)
    @contact_id = contact_id
    @name = name
    @subject = subject
    @state = state
  end

  def save
    read_contacts = Database.contacts << self
    save_contacts = Database.contact_save(read_contacts)
  end

  def self.all
    read_contacts = Database.contacts
  end
end
