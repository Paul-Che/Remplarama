class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :slots, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  # has_many :messages, through: [:bookings, :slots], dependent: :restrict_with_exception


  validates :speciality, inclusion: { in: ['Médecine générale', 'Kinésithérapie', 'Autre spécialité'] }, on: :update

  validates :convention, inclusion: { in: [nil,'1', '2', '3']}, on: :update
  validates :house_visits, inclusion: { in: [nil,'none', 'max2', 'above2']}, on: :update
  validates :house_visits_tolerance, inclusion: { in: [nil,'none', 'max2', 'above2']}, on: :update

  #validates :numero_ursaff, format: { with: /\d{18}/, message: "Votre numéro URSSAF n'est pas le bon" }, on: :update

end
