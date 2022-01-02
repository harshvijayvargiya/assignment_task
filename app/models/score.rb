class Score < ApplicationRecord

  #Associations
  belongs_to :player
  delegate :f_name, :l_name, to: :player

  belongs_to :game
  delegate :title, to: :game

  #Enum
  enum status: {win: 'win', loss: 'loss'}
end
