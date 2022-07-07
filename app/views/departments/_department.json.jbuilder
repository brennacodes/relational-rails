json.extract! department, :id, :name, :address, :jurisdiction, :active_cases, :is_federal, :created_at, :updated_at
json.url department_url(department, format: :json)
