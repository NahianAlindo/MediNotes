json.extract! patient, :id, :name, :contact_number, :created_at, :updated_at
json.url patient_url(patient, format: :json)
