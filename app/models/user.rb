class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  acts_as_messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :reviews_i_received, class_name: 'Review', foreign_key: :reviewed_id, dependent: :destroy
  has_many :reviews_i_made, class_name: 'Review', foreign_key: :reviewer_id, dependent: :destroy
  has_many :slots, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # has_many :messages, through: [:bookings, :slots], dependent: :restrict_with_exception


  validates :speciality, inclusion: { in: [nil, "", 'medg', 'kine', 'otherspe'] }, on: :update

  validates :convention, inclusion: { in: [nil,"",'1', '2', '3']}, on: :update
  validates :house_visits, inclusion: { in: [nil,"",'none', 'max2', 'above2']}, on: :update
  validates :house_visits_tolerance, inclusion: { in: [nil,"",'none', 'max2', 'above2']}, on: :update

  #validates :numero_ursaff, format: { with: /\d{18}/, message: "Votre numéro URSSAF n'est pas le bon" }, on: :update

  has_attachment :avatar

  def mailboxer_email(object)
    email
  end

end
