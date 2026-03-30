class CreateChallenges < ActiveRecord::Migration[7.2]
  def change
    create_table :challenges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true
      t.integer :progress_count, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.date :started_on, null: false
      t.datetime :completed_at

      t.timestamps
    end
  end
end
