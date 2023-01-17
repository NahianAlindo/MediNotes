class Patient < ApplicationRecord
  has_many :dosages
  has_many :prescriptions
end
