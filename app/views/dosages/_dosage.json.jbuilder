json.extract! dosage, :id, :timestamp, :blood_sugar_level, :prescribed_insulin, :applied_insulin, :patient_id, :created_at, :updated_at
json.url dosage_url(dosage, format: :json)
