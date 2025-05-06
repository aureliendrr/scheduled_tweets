require 'faker'

# Créer 20 prospects avec des données aléatoires
20.times do
  Prospect.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
  )
end

puts "20 prospects created!"
