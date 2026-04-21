class CreateWeeklyReflections < ActiveRecord::Migration[7.2]
  def change
    create_table :weekly_reflections do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.text :summary
      t.text :analysis
      t.text :encouragement

      t.timestamps
    end

    add_index :weekly_reflections, [:user_id, :start_date, :end_date], unique: true
  end
end
