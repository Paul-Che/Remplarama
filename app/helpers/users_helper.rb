module UsersHelper

  def is_profile_completed(user)
    !user.address.nil? &&
    user.address != "" &&
    !user.numero_ordre.nil? &&
    user.numero_ordre != "" &&
    !user.speciality.nil? &&
    user.speciality != "" &&
    if !user.has_practice
      !user.numero_ursaff.nil? &&
      user.numero_ursaff != ""
    else
      true
    end
  end

  def human_speciality(string)
    if string == "medg"
      "Médecine générale"
    elsif string == "kine"
      "Kinésithérapie"
    else
      "Autre spécialité"
    end
  end

  def human_house_visits(string)
    if string == "none"
      "Aucune visite à domicile"
    elsif string == "max2"
      "Jusqu'à 2 visites à domicile / jour en moyenne"
    elsif string == "above2"
      "Plus de 2 visites à domicile / jour en moyenne"
    else
      raw("<em>Part des visites à domicile non-renseignée</em>")
    end
  end

  def human_secretary(boolean)
    if boolean == true
      "Secrétariat disponible"
    elsif boolean == false
      "Pas de secrétariat"
    else
      raw("<em>Secrétariat : non-renseigné</em>")
    end
  end

  def human_housing(boolean)
    if boolean == true
      "Hébergement possible"
    elsif boolean == false
      "Pas d'hébergement possible"
    else
      raw("<em>Hébergement possible : non-renseigné</em>")
    end
  end

  def human_house_visits_tolerance(string)
    if string == "none"
      "Aucune visite à domicile acceptée"
    elsif string == "max2"
      "Maximum 2 visites à domicile / jour acceptées"
    elsif string == "above2"
      "Visites à domicile acceptées"
    else
      raw("<em>Tolérance des visites à domicile non-renseignée</em>")
    end
  end

  def human_nosecretary_tolerance(boolean)
    if boolean == true
      "Absence de secrétariat acceptée"
    elsif boolean == false
      "Secrétariat requis"
    else
      raw("<em>Secrétariat : non-renseigné</em>")
    end
  end

  def human_nohousing_tolerance(boolean)
    if boolean == true
      "Hébergement non-nécessaire"
    elsif boolean == false
      "Hébergement nécessaire"
    else
      raw("<em>Hébergement : non-renseigné</em>")
    end
  end
end
