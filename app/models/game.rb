class Game < ApplicationRecord

	#Associations
	has_many :scores, dependent: :destroy

	#Validations
	validates :title, presence: true
	validates :begin_date, :end_date, presence: true, on: :create

	#Callbacks
	after_commit :create_scores, on: :create

	private

	def create_scores
		player_ids = Player.ids
		return if player_ids.blank?

		2.times do
			score = self.scores.create(game_id: id, player_id: player_ids.sample, points: Random.rand(150))
			player_ids.delete(score.player_id)
		end
		self.scores.first.update(status: scores.first.points > scores.last.points ? 'win' : 'loss')
		self.scores.last.update(status: scores.last.points > scores.first.points ? 'win' : 'loss')
	end
end
