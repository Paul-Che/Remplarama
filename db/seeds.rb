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

User.create!(email: "chenon@gmail.com",
            password: "12345678",
            first_name: "Angéline",
            last_name: "Chenon",
            has_practice: true,
            numero_ordre: "A1B2C3D4E5",
            address: "1 Avenue des fontenelles, 35400, Saint-Malo",
            speciality: "Médecine générale",
            numero_ursaff: "111011101110111011",
            presentation: "Bonjour, je suis le Dr Angéline Chenon, médecin généraliste. J'exerce ce métier avec passion depuis plus de 20 ans. Le futur remplaçant qui serait intéressé sera encadré dans une équipe de 4 médecins et un secrétariat compétent. Un minimum de 10 consultations par jour pour les mois d'étés.",
            education: "Université Rennes",
            publications: "Après avoir obtenu mon Doctorat de Médecine Générale - Rennes (1998), je me suis installé dans le cabinet médical au 1 Avenue des fontenelles à Saint-Malo en 2012 après avoir exercé à Cancale pendant 15 ans.",
             housing: true,
            secretary: true,
            convention: "1",
            house_visits: "above2",
            commission: 90)
User.create!(email: "jeanne.darc@gmail.com",
            password: "12345678",
            first_name: "Jeanne",
            last_name: "Dupont",
            has_practice: true,
            numero_ordre: nil,
            address: "Avenue de moka, 35400, Saint-Malo",
            speciality: "Médecine générale",
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Jeanne Dupont, ophtalmologiste.",
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
            address: "3 rue broussais, 35400, Saint-Malo",
            speciality: "Médecine générale",
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
            address: "3 rue pierre jouan, 35400, Saint-Malo",
            speciality: "Médecine générale",
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
            address: "Quai saint-louis, 35400, Saint-Malo",
            speciality: "Médecine générale",
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

User.create!(email: "antoine@gmail.com",
            password: "12345678",
            first_name: "Antoine",
            last_name: "Loron",
            has_practice: false,
            numero_ordre: "A1B2C3D4E5",
            address: "rue de Saint-Maur, 75011, Paris",
            speciality: "Médecine générale",
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Antoine Loron, médecin généraliste remplaçant, fraîchement diplomé. Actuellement interne à l'hopital européen Georges-Pompidou à Rennes.",
            education: "Université de Rennes",
            publications: "Participation au projet Urgence-Afrique en tant que médecin sans frontière. Responsable des approvisionnements et gestion des risques sanitaires (été 2009 et 2010).",
            nohousing_tolerance: nil,
            nosecretary_tolerance: nil,
            convention: nil,
            house_visits_tolerance: "above2",
            min_commission: 80)
User.create!(email: "Didier.chenon@gmail.com",
            password: "12345678",
            first_name: "Didier",
            last_name: "Chelon",
            has_practice: false,
            numero_ordre: "A1B2C3D4E5",
            address: "Rue de Lévy, 75017, Paris",
            speciality: "Médecine générale",
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Didier Chelon, médecin généraliste remplaçant, fraîchement diplomé.",
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
            address: "2 Rue d'Échange, 35000, Rennes",
            speciality: "Médecine générale",
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Jérôme Burgaud, médecin généraliste remplaçant, fraîchement diplomé.",
            education: "Université de Rennes",
            publications: "Doctorat de Médecine Générale - Rennes (2010). D.E.S. en Médecine du sport - Rennes (2013)",
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
  if user.last_name != 'Loron'
    user.reviews_i_received.create!(content: "Cabinet très agréable. Je recommande le remplacement à Saint-Malo.", rating: 4, reviewer_id: User.last.id)
  end
end

# Créations des slots pour les utilisateurs

User.all.each do |user|
  user.slots.create!(start_date: ("Mon, 14 Mar 2016"), end_date: ("Fri, 18 Mar 2016"), status: "pending")
end

User.where("first_name LIKE '%Angéline%'").first.slots.create!(start_date: ("Mon, 29 Feb 2016"), end_date: ("Tue, 01 Mar 2016"), status: "confirmed")

User.where("first_name LIKE '%Jerome%'").first.bookings.create(start_date: ("Mon, 29 Feb 2016"), end_date: ("Tue, 01 Mar 2016"), user_id: 37, slot_id: User.where("first_name LIKE '%Angéline%'").first.slots.last.id, accepted: true)


User.where("first_name LIKE '%Antoine%'").first.slots.destroy_all














