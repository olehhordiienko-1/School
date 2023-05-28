class SubjectTeacher < ApplicationRecord
  belongs_to :personal_record
  belongs_to :subject
end
