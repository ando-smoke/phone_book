require("rspec")
require("contact")
require("phone")

describe(Contact) do
  describe("#first_name") do
    it("returns the first name of a contact") do
      test_phone = Phone.new({ type: "home",
        number: "503-555-4444" })
      test_contact = Contact.new({ first_name: "Wade",
        last_name: "Boggs", phone_numbers: test_phone })
      expect(test_contact.first_name()).to(eq("Wade"))
    end
  end
end
