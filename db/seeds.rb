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
            avatar: "http://www.rhsante.fr/wp-content/uploads/sites/2/2015/04/medecin-f-298.jpg",
            numero_ursaff: "111011101110111011",
            presentation: "Bonjour, je suis le Dr Angéline Chenon, médecin généraliste. J'exerce ce métier avec passion depuis plus de 30 ans. J'attache beaucoup d'importance à ma patientèle et à l'aspect humain de la relation professionnel. Je prend le temps qu'il faut pour les urgences et les cas qui me semblent importants, sinon en moyenne, je prend 30min par consultation. Je suis rigoureux sur les horaires. Le futur remplaçant qui serait intéressé se verra donc encadré par un secrétariat compétent et un minimum de 15 consultations par jour pour les mois d'étés, 20 à 25 consultations par jour en moyenne pour le reste de l'année.",
            education: "Université Angers",
            publications: "Après avoir obtenu mon Doctorat de Médecine Générale - Angers (1984), je me suis installé dans le cabinet médical au 1 Avenue des fontenelles à Saint-Malo en 2009 après avoir exercé à Cancale pendant une dizaine d'année.",
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
            avatar: "http://d236bkdxj385sg.cloudfront.net/wp-content/uploads/2011/11/dartmouth-old-lady-black-doctor-e1286646111253.jpg",
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
            address: "1 Avenue des fontenelles, 35400, Saint-Malo",
            speciality: "Médecine générale",
            avatar: "http://infinarium.com/wp-content/uploads/2013/04/Doctor-Says-No-Such-thing-as-Health-Myths-Google-Images.jpg",
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
            address: "1 Avenue des fontenelles, 35400, Saint-Malo",
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
            address: "Quai saint-louis, 35400, Saint-Malo",
            speciality: "Médecine générale",
            avatar: "https://s-media-cache-ak0.pinimg.com/236x/1b/91/0d/1b910ddb6f05806835337637d695b395.jpg",
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
            address: "36 rue Saint-louis, 35000, Rennes",
            speciality: "Médecine générale",
            avatar: "http://media.cirrusmedia.com.au/AD_Media_Library/AD_WEB_IMAGES/Medical/Young_doctor.jpg?width=300&height=300&mode=max",
            numero_ursaff: nil,
            presentation: "Bonjour, je suis le Dr Antoine Loron, médecin généraliste remplaçant, fraîchement diplomé. Actuellement interne à l'hopital européen Georges-Pompidou dans le 15 ème arrondissement.",
            education: "Université de Lyon III",
            publications: "Participation au projet Urgence-Afrique en tant que médecin sans frontière. Responsable des approvisionnements et gestion des risques sanitaires (été 2009 et 2010).",
            nohousing_tolerance: nil,
            nosecretary_tolerance: nil,
            convention: nil,
            house_visits_tolerance: "max2",
            min_commission: 60)
User.create!(email: "Didier.chenon@gmail.com",
            password: "12345678",
            first_name: "Dider",
            last_name: "Chelon",
            has_practice: false,
            numero_ordre: "A1B2C3D4E5",
            address: "Rue de Lévy, 75017 Paris",
            speciality: "Médecine générale",
            avatar: "http://dreamatico.com/data_images/doctor/doctor-5.jpg",
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
            avatar: "http://www.doctorsinperth.com/wp-content/uploads/2013/10/Doctors-in-Perth.png",
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
            avatar: "http://www.doctordisability.com/wp-content/uploads/2012/11/Doctor-Disability-How-Laughter-Helps-Doctors.jpg",
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
  user.slots.create!(start_date: ("Mon, 14 Mar 2016"), end_date: ("Fri, 18 Mar 2016"), status: "pending")
end

User.where("first_name LIKE '%Paul%'").first.slots.create!(start_date: ("Mon, 29 Feb 2016"), end_date: ("Tue, 01 Mar 2016"), status: "confirmed")
User.where("first_name LIKE '%Jerome%'").first.bookings.create(start_date: ("Mon, 29 Feb 2016"), end_date: ("Tue, 01 Mar 2016"), user_id: 37, slot_id: User.where("first_name LIKE '%Paul%'").first.slots.last.id, accepted: true)
















