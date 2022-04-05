require "application_system_test_case"

class EmiPaymentsTest < ApplicationSystemTestCase
  setup do
    @emi_payment = emi_payments(:one)
  end

  test "visiting the index" do
    visit emi_payments_url
    assert_selector "h1", text: "Emi payments"
  end

  test "should create emi payment" do
    visit emi_payments_url
    click_on "New emi payment"

    fill_in "Emi amt", with: @emi_payment.emi_amt
    fill_in "Paid emi amt", with: @emi_payment.paid_emi_amt
    fill_in "Principal amt", with: @emi_payment.principal_amt
    click_on "Create Emi payment"

    assert_text "Emi payment was successfully created"
    click_on "Back"
  end

  test "should update Emi payment" do
    visit emi_payment_url(@emi_payment)
    click_on "Edit this emi payment", match: :first

    fill_in "Emi amt", with: @emi_payment.emi_amt
    fill_in "Paid emi amt", with: @emi_payment.paid_emi_amt
    fill_in "Principal amt", with: @emi_payment.principal_amt
    click_on "Update Emi payment"

    assert_text "Emi payment was successfully updated"
    click_on "Back"
  end

  test "should destroy Emi payment" do
    visit emi_payment_url(@emi_payment)
    click_on "Destroy this emi payment", match: :first

    assert_text "Emi payment was successfully destroyed"
  end
end
