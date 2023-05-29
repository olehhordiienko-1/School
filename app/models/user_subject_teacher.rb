class UserSubjectTeacher < ApplicationRecord
  belongs_to :user
  belongs_to :subject_teacher
end
