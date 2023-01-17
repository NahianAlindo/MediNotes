require "application_system_test_case"

class PrescriptionsTest < ApplicationSystemTestCase
  setup do
    @prescription = prescriptions(:one)
  end

  test "visiting the index" do
    visit prescriptions_url
    assert_selector "h1", text: "Prescriptions"
  end

  test "creating a Prescription" do
    visit prescriptions_url
    click_on "New Prescription"

    fill_in "Patient", with: @prescription.Patient_id
    fill_in "Comments", with: @prescription.comments
    fill_in "End date", with: @prescription.end_date
    fill_in "Prescribed insulin", with: @prescription.prescribed_insulin
    fill_in "Prescribed on", with: @prescription.prescribed_on
    fill_in "Start date", with: @prescription.start_date
    click_on "Create Prescription"

    assert_text "Prescription was successfully created"
    click_on "Back"
  end

  test "updating a Prescription" do
    visit prescriptions_url
    click_on "Edit", match: :first

    fill_in "Patient", with: @prescription.Patient_id
    fill_in "Comments", with: @prescription.comments
    fill_in "End date", with: @prescription.end_date
    fill_in "Prescribed insulin", with: @prescription.prescribed_insulin
    fill_in "Prescribed on", with: @prescription.prescribed_on
    fill_in "Start date", with: @prescription.start_date
    click_on "Update Prescription"

    assert_text "Prescription was successfully updated"
    click_on "Back"
  end

  test "destroying a Prescription" do
    visit prescriptions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prescription was successfully destroyed"
  end
end
