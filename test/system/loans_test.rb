require "application_system_test_case"

class LoansTest < ApplicationSystemTestCase
  setup do
    @loan = loans(:one)
  end

  test "visiting the index" do
    visit loans_url
    assert_selector "h1", text: "Loans"
  end

  test "should create loan" do
    visit loans_url
    click_on "New loan"

    fill_in "Loan amt", with: @loan.loan_amt
    fill_in "Monthly emi", with: @loan.monthly_emi
    check "Monthly emi changable" if @loan.monthly_emi_changable
    fill_in "Monthly payment date", with: @loan.monthly_payment_date
    fill_in "Total loan period", with: @loan.total_loan_period
    fill_in "Total payment", with: @loan.total_payment
    click_on "Create Loan"

    assert_text "Loan was successfully created"
    click_on "Back"
  end

  test "should update Loan" do
    visit loan_url(@loan)
    click_on "Edit this loan", match: :first

    fill_in "Loan amt", with: @loan.loan_amt
    fill_in "Monthly emi", with: @loan.monthly_emi
    check "Monthly emi changable" if @loan.monthly_emi_changable
    fill_in "Monthly payment date", with: @loan.monthly_payment_date
    fill_in "Total loan period", with: @loan.total_loan_period
    fill_in "Total payment", with: @loan.total_payment
    click_on "Update Loan"

    assert_text "Loan was successfully updated"
    click_on "Back"
  end

  test "should destroy Loan" do
    visit loan_url(@loan)
    click_on "Destroy this loan", match: :first

    assert_text "Loan was successfully destroyed"
  end
end
