require "application_system_test_case"

class DosagesTest < ApplicationSystemTestCase
  setup do
    @dosage = dosages(:one)
  end

  test "visiting the index" do
    visit dosages_url
    assert_selector "h1", text: "Dosages"
  end

  test "creating a Dosage" do
    visit dosages_url
    click_on "New Dosage"

    fill_in "Applied insulin", with: @dosage.applied_insulin
    fill_in "Blood sugar level", with: @dosage.blood_sugar_level
    fill_in "Patient", with: @dosage.patient_id
    fill_in "Prescribed insulin", with: @dosage.prescribed_insulin
    fill_in "Timestamp", with: @dosage.timestamp
    click_on "Create Dosage"

    assert_text "Dosage was successfully created"
    click_on "Back"
  end

  test "updating a Dosage" do
    visit dosages_url
    click_on "Edit", match: :first

    fill_in "Applied insulin", with: @dosage.applied_insulin
    fill_in "Blood sugar level", with: @dosage.blood_sugar_level
    fill_in "Patient", with: @dosage.patient_id
    fill_in "Prescribed insulin", with: @dosage.prescribed_insulin
    fill_in "Timestamp", with: @dosage.timestamp
    click_on "Update Dosage"

    assert_text "Dosage was successfully updated"
    click_on "Back"
  end

  test "destroying a Dosage" do
    visit dosages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dosage was successfully destroyed"
  end
end
