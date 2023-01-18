class Dosage < ApplicationRecord
  belongs_to :patient
  # before_save :set_applied_insulin
  scope :ordered, -> { order(timestamp: :desc) }
  private
  def set_applied_insulin
    if self.blood_sugar_level == 7
      self.applied_insulin = self.prescribed_insulin
    elsif self.blood_sugar_level > 7
      self.applied_insulin = self.prescribed_insulin + 2
    elsif self.blood_sugar_level < 7
      self.applied_insulin = self.prescribed_insulin - 2
    end
  end

end
