class Contact

  attr_reader :first_name, :last_name

  define_method(:initialize) do |contact_data|
    @first_name = contact_data[:first_name]
    @last_name = contact_data[:last_name]
    @phone_numbers = contact_data[:phone_numbers]
  end

end
