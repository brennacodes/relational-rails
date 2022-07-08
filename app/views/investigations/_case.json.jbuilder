json.extract! investigation, :id, :subject, :uid, :active, :active_leads, :department_id, :created_at, :updated_at
json.url investigation_url(investigation, format: :json)
