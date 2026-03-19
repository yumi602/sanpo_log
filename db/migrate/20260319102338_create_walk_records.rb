class CreateWalkRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :walk_records do |t|
      t.string :title
      t.text :body
      t.date :walked_on
      t.integer :mood
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
