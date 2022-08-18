class ChangeDobFromStringToDatetime < ActiveRecord::Migration[7.0]
  def change
    change_column :birthdays, :dob, :date
  end
end
