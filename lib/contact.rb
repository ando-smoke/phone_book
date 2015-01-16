class Contact

  @@all_contacts = []

  attr_reader :first_name, :last_name, :phone_numbers

  define_method(:initialize) do |contact_data|
    @first_name = contact_data[:first_name]
    @last_name = contact_data[:last_name]
    @phone_numbers = contact_data[:phone_numbers]
  end

  define_method(:add_phone_number) do |new_phone|
    @phone_numbers.push(new_phone)
  end

  define_method(:save) do
    @@all_contacts.push(self)
  end

  define_singleton_method(:all) do
    @@all_contacts
  end

  define_singleton_method(:clear) do
    @@all_contacts = []
  end

end
