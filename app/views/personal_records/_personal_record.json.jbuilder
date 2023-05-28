json.extract! personal_record, :id, :last_name, :middle_name, :first_name, :education, :contacts, :description, :created_at, :updated_at
json.url personal_record_url(personal_record, format: :json)
