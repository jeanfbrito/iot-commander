class CreateReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :readings do |t|
      t.jsonb :data
      t.datetime :timestamp
      t.references :device, foreign_key: true

      t.timestamps
    end
  end
end
