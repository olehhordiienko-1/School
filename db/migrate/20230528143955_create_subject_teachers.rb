class CreateSubjectTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :subject_teachers do |t|
      t.references :personal_record, null: false, foreign_key: true
      t.references :subject, null: false, foreign_key: true
      t.string :academic_year

      t.timestamps
    end
  end
end
