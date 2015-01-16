require("rspec")
require("contact")
require("phone")

describe(Contact) do
  describe("#first_name") do
    it("returns the first name of a contact") do
      test_phone = Phone.new({ type: "home", number: "503-555-4444" })
      test_contact = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: test_phone })
      expect(test_contact.first_name()).to(eq("Wade"))
    end
  end

  describe("#last_name") do
    it("returns the last name of a contact") do
      test_phone = Phone.new({ type: "home", number: "503-555-4444" })
      test_contact = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: test_phone })
      expect(test_contact.last_name()).to(eq("Boggs"))
    end
  end

  describe("#phone_numbers") do
    it("returns the entire list of phone numbers of a contact") do
      test_phone_1 = Phone.new({ type: "home", number: "503-555-4444" })
      test_phone_2 = Phone.new({ type: "work", number: "503-222-7777" })
      test_contact = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: [test_phone_1, test_phone_2] })
      expect(test_contact.phone_numbers()).to(eq([test_phone_1, test_phone_2]))
    end
  end

  describe("#add_phone_number") do
    it("adds a phone number and type onto the list of phone numbers " \
      "for a contact.") do
      test_phone_1 = Phone.new({ type: "home", number: "503-555-4444" })
      test_phone_2 = Phone.new({ type: "work", number: "503-222-7777" })
      test_contact = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: [test_phone_1] })
      test_contact.add_phone_number(test_phone_2)
      expect(test_contact.phone_numbers()).to(eq([test_phone_1, test_phone_2]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a contact to the array of saved contacts (i.e. @@all_contacts)") do
      test_phone = Phone.new({ type: "home", number: "503-555-4444" })
      test_contact = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: [test_phone] })
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end
end
