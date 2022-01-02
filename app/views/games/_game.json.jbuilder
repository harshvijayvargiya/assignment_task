json.extract! game, :id, :title, :begin_date, :end_date, :created_at, :updated_at
json.url game_url(game, format: :json)
