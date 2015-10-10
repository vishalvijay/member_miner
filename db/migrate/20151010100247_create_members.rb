class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.text :caption
      t.string :ethnicity
      t.float :weight
      t.float :height
      t.boolean :is_veg
      t.boolean :drink
      t.date :dob

      t.timestamps null: false
    end
    add_index :members, :ethnicity
    add_index :members, :dob
  end
end
