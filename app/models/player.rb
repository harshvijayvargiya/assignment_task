class Player < ApplicationRecord
  # Associtations
  has_many :scores, dependent: :destroy

  # Validations
  validates :f_name, :l_name, :contact, :join_date, presence: true
  validates :join_date, presence: true, on: :create

  # Scope
  scope :top_avg_player, -> { joins(:scores).group(:id).maximum(:points).keys }
  scope :played_10_game, ->(ids) { where(id: ids).includes(:scores).order('scores.points desc') }

  # To merge f_name & l_name
  def full_name
    "#{f_name} #{l_name}"
  end

  def member_profile
    scores = self.scores.order(points: :desc)
    high_score = scores.first
    {
      full_name: full_name.capitalize,
      contact: contact,
      no_of_wins: scores&.win&.count || 'NA',
      no_of_loss: scores&.loss&.count || 'NA',
      avg_score: scores.average(:points).to_f.round(2) || 0,
      high_score: high_score&.points || 0,
      when: high_score&.created_at&.strftime('%Y-%m-%d') || 'NA',
      game: high_score&.title&.capitalize || 'NA',
      whom: Score.where.not(player_id: id).where(game_id: high_score&.game_id).first&.f_name&.capitalize || 'NA'
    }
  end
end
