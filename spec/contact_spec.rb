require("rspec")
require("contact")
require("phone")

describe(Contact) do

  before() do
    Contact.clear()
  end

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

    it("is always in sorted order by last name, first name ascending") do
      test_phone = Phone.new({ type: "home", number: "503-555-4444" })
      test_contact_1 = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: [test_phone] })
      test_contact_1.save()
      test_contact_2 = Contact.new({ first_name: "Sam",
        last_name: "Snead", phone_numbers: [test_phone] })
      test_contact_2.save()
      test_contact_3 = Contact.new({ first_name: "Bob",
        last_name: "Barker", phone_numbers: [test_phone] })
      test_contact_3.save()
      expect(Contact.all()).to(eq([test_contact_3, test_contact_1,
        test_contact_2]))
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

  describe(".clear") do
    it("clears out all save contacts from the array of saved contacts " \
      "(i.e. @@all_contacts)") do
      test_phone = Phone.new({ type: "home", number: "503-555-8888" })
      test_contact = Contact.new({ first_name: "Billy",
        last_name: "Barool", phone_numbers: [test_phone] })
      test_contact.save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#<=>") do
    it("sorts two contacts by last name then first name") do
      test_phone_1 = Phone.new({ type: "home", number: "503-555-4444" })
      test_phone_2 = Phone.new({ type: "work", number: "503-222-7777" })
      test_contact_1 = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: [test_phone_1] })
      test_contact_2 = Contact.new({ first_name: "Sam",
        last_name: "Snead", phone_numbers: [test_phone_2] })
      expect(test_contact_1 <=> test_contact_2).to(eq(-1))
    end

    it("sorts two contacts by last name then first name") do
      test_phone_1 = Phone.new({ type: "home", number: "503-555-4444" })
      test_phone_2 = Phone.new({ type: "work", number: "503-222-7777" })
      test_contact_1 = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: [test_phone_1] })
      test_contact_2 = Contact.new({ first_name: "Sam",
        last_name: "Snead", phone_numbers: [test_phone_2] })
      expect(test_contact_2 <=> test_contact_1).to(eq(1))
    end

    it("sorts two contacts by last name then first name") do
      test_phone_1 = Phone.new({ type: "home", number: "503-555-4444" })
      test_phone_2 = Phone.new({ type: "work", number: "503-222-7777" })
      test_contact_1 = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: [test_phone_1] })
      test_contact_2 = Contact.new({ first_name: "wade",
        last_name: "boggs", phone_numbers: [test_phone_2] })
      expect(test_contact_2 <=> test_contact_1).to(eq(0))
    end

    it("sorts two contacts by last name then first name") do
      test_phone_1 = Phone.new({ type: "home", number: "503-555-4444" })
      test_phone_2 = Phone.new({ type: "work", number: "503-222-7777" })
      test_contact_1 = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: [test_phone_1] })
      test_contact_2 = Contact.new({ first_name: "Xavier",
        last_name: "Boggs", phone_numbers: [test_phone_2] })
      expect(test_contact_1 <=> test_contact_2).to(eq(-1))
    end

    it("sorts two contacts by last name then first name") do
      test_phone_1 = Phone.new({ type: "home", number: "503-555-4444" })
      test_phone_2 = Phone.new({ type: "work", number: "503-222-7777" })
      test_contact_1 = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: [test_phone_1] })
      test_contact_2 = Contact.new({ first_name: "Xavier",
        last_name: "Boggs", phone_numbers: [test_phone_2] })
      expect(test_contact_2 <=> test_contact_1).to(eq(1))
    end
  end

  describe("#id") do
    it("return the id number for a contact") do
      test_phone = Phone.new({ type: "home", number: "503-555-4444" })
      test_contact = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: [test_phone] })
      test_contact.save()
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("returns a contact by its id number") do
      test_phone_1 = Phone.new({ type: "home", number: "503-555-4444" })
      test_phone_2 = Phone.new({ type: "work", number: "503-222-7777" })
      test_contact_1 = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: [test_phone_1] })
      test_contact_1.save()
      test_contact_2 = Contact.new({ first_name: "Xavier",
        last_name: "Boggs", phone_numbers: [test_phone_2] })
      test_contact_2.save()
      expect(Contact.find(test_contact_1.id())).to(eq(test_contact_1))
    end
  end
end
