require "./db/database"

class Contact

  attr_reader :contact_id, :name, :subject, :state

  def initialize(name, subject, state)
    @contact_id = automatic_generate_id
    @name = name
    @subject = subject
    @state = state
  end

  def automatic_generate_id
    read_contacts = Database.contacts
    read_contacts.map { |id| id.contact_id}
    generate_id = rand(100)
    read_contacts.each do |id|
      if generate_id == id
        generate_id = rand(100)
      end
    end
    generate_id
  end

  def destroy
  end

  def self.find
  end

  def save
    read_contacts = Database.contacts << self
    save_contacts = Database.contact_save(read_contacts)
  end

  def self.all
    read_contacts = Database.contacts
  end
end
