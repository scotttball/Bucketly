class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.text :bio
      t.string :location

      t.timestamps null: false
    end
  end
end
