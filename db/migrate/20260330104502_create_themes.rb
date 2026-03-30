class CreateThemes < ActiveRecord::Migration[7.2]
  def change
    create_table :themes do |t|
      t.string :name, null: false
      t.text :description
      t.string :image_path
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
