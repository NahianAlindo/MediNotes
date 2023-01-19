class Patient < ApplicationRecord
  has_many :dosages, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :appointments
  belongs_to :user, optional: true
end
