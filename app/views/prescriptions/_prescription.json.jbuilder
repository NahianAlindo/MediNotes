json.extract! prescription, :id, :prescribed_on, :start_date, :end_date, :prescribed_insulin, :comments, :Patient_id, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)
