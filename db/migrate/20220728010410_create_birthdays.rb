class CreateBirthdays < ActiveRecord::Migration[7.0]
  def change
    create_table :birthdays do |t|
      t.string :name
      t.text :dob

      t.timestamps
    end
  end
end
