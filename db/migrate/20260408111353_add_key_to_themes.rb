class AddKeyToThemes < ActiveRecord::Migration[7.2]
  def change
    add_column :themes, :key, :string
  end
end
