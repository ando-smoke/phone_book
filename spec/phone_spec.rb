require("rspec")
require("phone")

describe(Phone) do
  it("returns the phone type of the phone number") do
    test_phone = Phone.new({type: "home", number: "503-555-4444"})
    expect(test_phone.type()).to(eq("home"))
  end
end
