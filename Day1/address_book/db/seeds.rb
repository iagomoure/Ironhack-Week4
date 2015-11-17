(1..4).each do |index|
	Contact.create(name: "Name #{index}", address: "Address #{index}", phone: "Phone #{index}", email: "Email #{index}")
end