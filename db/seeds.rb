# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Booking.destroy_all
Slot.destroy_all
Review.destroy_all
User.destroy_all

# Créations des users "Practice"

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
            numero_ordre: nil,
            address: "Place de l'Odéon, Paris",
            speciality: "Médecine générale",
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
            speciality: "Médecine générale",
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
            speciality: "Médecine générale",
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


# Créations des users "Remplaçant"

User.create!(email: "loron.antoine@gmail.com",
            password: "12345678",
            first_name: "Antoine",
            last_name: "Loron",
            has_practice: false,
            numero_ordre: "A1B2C3D4E5",
            address: "36 rue Beaurepaire, 75010, Paris",
            speciality: "Médecine générale",
            avatar: nil,
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Antoine Loron, médecin généraliste remplaçant, fraîchement diplomé.",
            education: "Université de Lyon III",
            publications: "Pas de publication",
            nohousing_tolerance: nil,
            nosecretary_tolerance: nil,
            convention: nil,
            house_visits_tolerance: "max2",
            min_commission: 60)
User.create!(email: "paul.chenon@gmail.com",
            password: "12345678",
            first_name: "Paul",
            last_name: "Chenon",
            has_practice: false,
            numero_ordre: "A1B2C3D4E5",
            address: "Rue de Lévy, 75017 Paris",
            speciality: "Médecine générale",
            avatar: nil,
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Paul Chénon, médecin généraliste remplaçant, fraîchement diplomé.",
            education: "Université de Saint Malo",
            publications: "Pas de publication",
            nohousing_tolerance: false,
            nosecretary_tolerance: nil,
            convention: nil,
            house_visits_tolerance: "none",
            min_commission: 70)
User.create!(email: "jerome.burgaud@gmail.com",
            password: "12345678",
            first_name: "Jerome",
            last_name: "Burgaud",
            has_practice: false,
            numero_ordre: "A1B2C3D4E5",
            address: "Rue du commerce, 75015, Paris",
            speciality: "Médecine générale",
            avatar: nil,
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Jérôme Burgaud, médecin généraliste remplaçant, fraîchement diplomé.",
            education: "Université de Rennes",
            publications: "Pas de publication",
            nohousing_tolerance: nil,
            nosecretary_tolerance: false,
            convention: nil,
            house_visits_tolerance: "above2",
            min_commission: 90)
User.create!(email: "pierre.martin@gmail.com",
            password: "12345678",
            first_name: "Pierre",
            last_name: "Martin",
            has_practice: false,
            numero_ordre: "A1B2C3D4E5",
            address: "Rue chapon, 75003, Paris",
            speciality: "Médecine générale",
            avatar: nil,
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Pierre Martin, médecin généraliste remplaçant, fraîchement diplomé.",
            education: "Université de Rennes",
            publications: "Pas de publication",
            nohousing_tolerance: nil,
            nosecretary_tolerance: true,
            convention: nil,
            house_visits_tolerance: "max2",
            min_commission: 80)
User.create!(email: "ludovic.dupont@gmail.com",
            password: "12345678",
            first_name: "Ludovic",
            last_name: "Dupont",
            has_practice: false,
            numero_ordre: "A1B2C3D4E5",
            address: "Place d'Italie, Paris",
            speciality: "Médecine générale",
            avatar: nil,
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Ludovic Dupont, médecin généraliste remplaçant, fraîchement diplomé.",
            education: "Université de Paris II",
            publications: "Pas de publication",
            nohousing_tolerance: true,
            nosecretary_tolerance: false,
            convention: nil,
            house_visits_tolerance: nil,
            min_commission: 80)

# Créations des reviews pour toutes les utilisateurs

User.all.each do |user|
  user.reviews_i_received.create!(content: "Super sympa !", rating: 4, reviewer_id: User.last.id)
end

# Créations des slots pour les utilisateurs

User.all.each do |user|
  user.slots.create!(start_date: ("Wed, 02 Mar 2016"), end_date: ("Wed, 03 Mar 2016"), status: "pending")
end
















