class CreateBirthdays < ActiveRecord::Migration[7.0]
  def change
    create_table :birthdays do |t|
      t.string :name
      t.string :birthday

      t.timestamps
    end
  end
end
