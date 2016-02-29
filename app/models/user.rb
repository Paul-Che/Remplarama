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
  has_many :messages, through: [:bookings, :slots], dependent: :restrict_with_exception

  def slot_ranges
    ActiveRecord::Base.connection.execute(
      <<~HEREDOC
        select min(day) as start_date, max(day) as end_date
        from (
            select
                day,
                day - (dense_rank() over(order by day))::int g
            from slots
            where user_id = #{id}
        ) s
        group by s.g
        order by 1
      HEREDOC
    )
  end

  validates :speciality, inclusion: { in: ['Médecine générale', 'Kinésithérapie', 'Autre spécialité'] }, on: :update

  validates :convention, inclusion: { in: [nil,'1', '2', '3']}, on: :update
  validates :house_visits, inclusion: { in: [nil,'none', 'max2', 'above2']}, on: :update
  validates :house_visits_tolerance, inclusion: { in: [nil,'none', 'max2', 'above2']}, on: :update

  #validates :numero_ursaff, format: { with: /\d{18}/, message: "Votre numéro URSSAF n'est pas le bon" }, on: :update

end
