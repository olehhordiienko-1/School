class CreateGraduates < ActiveRecord::Migration[7.0]
  def change
    create_table :graduates do |t|
      t.string :last_name
      t.string :first_name
      t.integer :graduation_year
      t.text :zno_scores
      t.string :university
      t.text :feedback

      t.timestamps
    end
  end
end
