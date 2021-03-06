require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/phone")
require("./lib/contact")

get("/") do
  @contacts = Contact.all()
  erb(:index)
end

post("/add_contact") do
  first_name = params.fetch("first_name")
  last_name = params.fetch("last_name")
  phone_type = params.fetch("phone_type")
  phone_number = params.fetch("phone_number")
  phone = Phone.new({ type: phone_type, number: phone_number })
  new_contact = Contact.new({ first_name: first_name,
    last_name: last_name, phone_numbers: [phone] })
  new_contact.save()
  @contacts = Contact.all()
  erb(:index)
end

post("/clear_all_contacts") do
  Contact.clear()
  redirect("/")
end

get("/contacts/:id") do
  @contact = Contact.find(params.fetch("id").to_i())
  erb(:contact)
end

post("/add_phone_number") do
  phone_type = params.fetch("phone_type")
  phone_number = params.fetch("phone_number")
  phone = Phone.new({ type: phone_type, number: phone_number })
  @contact = Contact.find(params.fetch("contact_id"))
  @contact.add_phone_number(phone)
  erb(:contact)
end
