# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

User.create!(email: "michel.michel@gmail.com",
            password: "12345678",
            first_name: "Michel",
            last_name: "Michel",
            has_practice: true,
            numero_ordre: "A1B2C3D4E5",
            address: "100 avenue des champs élysées, 75008 Paris",
            speciality: "Médecine générale",
            avatar: nil,
            numero_ursaff: "111011101110111011",
            presentation: "Bonjour, je suis le Dr Michel Michel, médecin généraliste.",
            education: "Université Paris Diderot",
            publications: "Mes publications sont ...",
            housing: true,
            secretary: true,
            convention: "1",
            house_visits: "none",
            commission: 90)
User.create!(email: "jeanne.darc@gmail.com",
            password: "12345678",
            first_name: "Jeanne",
            last_name: "D'Arc",
            has_practice: true,
            numero_ordre: "A1B2C3D4E5",
            address: "Place de l'Odéon, Paris",
            speciality: "Autre spécialité",
            avatar: nil,
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Jeanne D'Arc, ophtalmologiste.",
            education: "Université Lyon 3",
            publications: "Je n'ai pas de publication",
            housing: true,
            secretary: true,
            convention: "2",
            house_visits: "max2",
            commission: 80)
User.create!(email: "martin.pecheur@gmail.com",
            password: "12345678",
            first_name: "Martin",
            last_name: "Pêcheur",
            has_practice: true,
            numero_ordre: "A1B2C3D4E5",
            address: "Gare de Lyon, Paris",
            speciality: "Kinésithérapie",
            avatar: nil,
            numero_ursaff: nil,
            presentation: "Bonjour, je suis Martin Pêcheur, kinésithérapeuthe.",
            education: "Université Marseille centre",
            publications: "Pas de publication",
            housing: false,
            secretary: false,
            convention: "3",
            house_visits: "above2",
            commission: 70)
User.create!(email: "edouard.lesoin@gmail.com",
            password: "12345678",
            first_name: "Edouard",
            last_name: "Le soin",
            has_practice: true,
            numero_ordre: "A1B2C3D4E5",
            address: "1 place de la République, Paris",
            speciality: "Autre spécialité",
            avatar: nil,
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Edouard Le soin, chirurgien libéral.",
            education: "Faculté de médecine de Bordeaux",
            publications: "Pas de publication",
            housing: true,
            secretary: true,
            convention: "1",
            house_visits: "none",
            commission: 60)
User.create!(email: "jacques.wagon@gmail.com",
            password: "12345678",
            first_name: "Jacques",
            last_name: "Wagon",
            has_practice: true,
            numero_ordre: "A1B2C3D4E5",
            address: "10 rue du commerce, 75010, Paris",
            speciality: "Médecine générale",
            avatar: nil,
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Jacques Wagon, médecin généraliste.",
            education: "Université de Paris V",
            publications: "Pas de publication",
            housing: false,
            secretary: true,
            convention: "2",
            house_visits: "max2",
            commission: 50)


User.all.each do |user|
  user.reviews.create!(content: "Super sympa !", rating: 4)
end

User.all.each do |user|
  user.slots.new(day: ("Wed, 02 Mar 2016"), status: "pending")
  user.slots.new(day: ("Thu, 03 Mar 2016"), status: "pending")
  user.save
end

