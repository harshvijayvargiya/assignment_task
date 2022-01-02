class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title
      t.datetime :begin_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
