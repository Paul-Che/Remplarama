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

  def slot_ranges
    ActiveRecord::Base.connection.execute(
      <<~HEREDOC
        select min(day), max(day)
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

  validates :speciality, inclusion: { in: ['Médecine générale', 'Kinésithérapie', 'Autre spécialité'] }
  validates :convention, inclusion: { in: ['Conventionné secteur 1', 'Conventionné secteur 2', 'Non conventionné']}
  validates :house_visits, inclusion: { in: ['Aucune', '<= 2 / jour', '> 2 / jour']}

end
