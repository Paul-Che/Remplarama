class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :reviews_i_received, class_name: 'Review', foreign_key: :reviewed_id, dependent: :destroy
  has_many :reviews_i_made, class_name: 'Review', foreign_key: :reviewer_id, dependent: :destroy
  has_many :slots, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :messages
  # has_many :messages, through: [:bookings, :slots], dependent: :restrict_with_exception

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :has_practice, inclusion: { in: [true, false] }
  validates :speciality, inclusion: { in: [nil, "", 'medg', 'kine', 'otherspe'] }, on: :update

  validates :convention, inclusion: { in: [nil,"",'1', '2', '3']}, on: :update
  validates :house_visits, inclusion: { in: [nil,"",'none', 'max2', 'above2']}, on: :update
  validates :house_visits_tolerance, inclusion: { in: [nil,"",'none', 'max2', 'above2']}, on: :update

  #validates :numero_ursaff, format: { with: /\d{18}/, message: "Votre numéro URSSAF n'est pas le bon" }, on: :update

  def conversations
     Conversation.includes(:messages)
                 .where("user1_id = :id OR user2_id = :id", id: id)
                 .order("messages.created_at DESC")
   end

   def other_user(conversation)
     conversation.users.include?(self) ? conversation.other_user(self) : nil
   end

   def unread_conversations
     conversations.select { |c| c.unread_messages?(self) }
   end

   def unread_conversations_count
     unread_conversations.count
   end

   def unread_conversations?
     unread_conversations_count > 0
   end

   def one_avatar_url
     avatar ? avatar : "http://placehold.it/64x64"
   end

  has_attachment :avatar

end
