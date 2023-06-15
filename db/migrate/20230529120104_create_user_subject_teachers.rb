class CreateUserSubjectTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_subject_teachers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :subject_teacher, null: false, foreign_key: true
      t.integer :score
      t.integer :year

      t.timestamps
    end
  end
end
