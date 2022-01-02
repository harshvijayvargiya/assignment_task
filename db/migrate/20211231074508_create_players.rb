class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :f_name
      t.string :l_name
      t.datetime :join_date
      t.string :contact

      t.timestamps
    end
  end
end
