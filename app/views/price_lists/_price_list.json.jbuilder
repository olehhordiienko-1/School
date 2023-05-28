json.extract! price_list, :id, :payment_type, :tuition_cost, :year, :description, :created_at, :updated_at
json.url price_list_url(price_list, format: :json)
