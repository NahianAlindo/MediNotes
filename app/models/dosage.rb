class Dosage < ApplicationRecord
  belongs_to :patient
  paginates_per 5
  before_save :validate_applied_insulin
  scope :ordered, -> { order(timestamp: :desc) }
  private
  def validate_applied_insulin
    raise "You cannot apply this dose" unless [self.prescribed_insulin-2, self.prescribed_insulin, self.prescribed_insulin+2].include?(self.applied_insulin)
  end

end
