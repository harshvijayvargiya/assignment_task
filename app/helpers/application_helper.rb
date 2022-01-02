module ApplicationHelper
  def sidebar_menus
    base_menu = [
      { name: 'Score Board', url: root_path },
      { name: 'Games', url: games_path },
      { name: 'Players', url: players_path },
      { name: 'Game Scores', url: all_scores_players_path }
    ]
  end
end
