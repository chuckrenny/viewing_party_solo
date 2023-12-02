class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.integer :movie_id, null: false
      t.string :movie_title
      t.integer :duration
      t.date :date
      t.integer :start_time

      t.timestamps
    end
  end
end
