# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
User.create(email: "test1@gmail.com",
            encrypted_password: "12345678",
            first_name: "Test1",
            last_name: "TEST1",
            has_practice: true,
            numero_ordre: "A1B2C3D4E5",
            address: "Adresse postale de Test1",
            speciality: "Généraliste",
            avatar: nil,
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Test1 TEST1, médecin généraliste.",
            education: "Université Paris Diderot",
            publications: "Mes publications sont ...")
User.create(email: "test2@gmail.com",
            encrypted_password: "12345678",
            first_name: "Test2",
            last_name: "TEST2",
            has_practice: true,
            numero_ordre: "A1B2C3D4E5",
            address: "Adresse postale de Test2",
            speciality: "Ophtalmo",
            avatar: nil,
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Test2 TEST2, ophtalmologiste.",
            education: "Université Lyon 3",
            publications: "Je n'ai pas de publication")
User.create(email: "test3@gmail.com",
            encrypted_password: "12345678",
            first_name: "Test3",
            last_name: "TEST3",
            has_practice: true,
            numero_ordre: "A1B2C3D4E5",
            address: "Adresse postale de Test3",
            speciality: "Kiné",
            avatar: nil,
            numero_ursaff: nil,
            presentation: "Bonjour, je suis Test3 TEST3, kinésithérapeuthe.",
            education: "Université Marseille centre",
            publications: "Pas de publication")
