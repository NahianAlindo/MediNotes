require 'test_helper'

class DosagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dosage = dosages(:one)
  end

  test "should get index" do
    get dosages_url
    assert_response :success
  end

  test "should get new" do
    get new_dosage_url
    assert_response :success
  end

  test "should create dosage" do
    assert_difference('Dosage.count') do
      post dosages_url, params: { dosage: { applied_insulin: @dosage.applied_insulin, blood_sugar_level: @dosage.blood_sugar_level, patient_id: @dosage.patient_id, prescribed_insulin: @dosage.prescribed_insulin, timestamp: @dosage.timestamp } }
    end

    assert_redirected_to dosage_url(Dosage.last)
  end

  test "should show dosage" do
    get dosage_url(@dosage)
    assert_response :success
  end

  test "should get edit" do
    get edit_dosage_url(@dosage)
    assert_response :success
  end

  test "should update dosage" do
    patch dosage_url(@dosage), params: { dosage: { applied_insulin: @dosage.applied_insulin, blood_sugar_level: @dosage.blood_sugar_level, patient_id: @dosage.patient_id, prescribed_insulin: @dosage.prescribed_insulin, timestamp: @dosage.timestamp } }
    assert_redirected_to dosage_url(@dosage)
  end

  test "should destroy dosage" do
    assert_difference('Dosage.count', -1) do
      delete dosage_url(@dosage)
    end

    assert_redirected_to dosages_url
  end
end
