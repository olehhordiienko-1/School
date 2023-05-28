class CreatePersonalRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_records do |t|
      t.string :last_name
      t.string :middle_name
      t.string :first_name
      t.string :education
      t.string :contacts
      t.text :description

      t.timestamps
    end
  end
end
