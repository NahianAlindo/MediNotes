class Prescription < ApplicationRecord
  belongs_to :patient
  scope :ordered, -> { order(prescribed_on: :desc) }
end
