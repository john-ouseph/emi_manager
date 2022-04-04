require "test_helper"

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:one)
  end

  test "should get index" do
    get loans_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_url
    assert_response :success
  end

  test "should create loan" do
    assert_difference("Loan.count") do
      post loans_url, params: { loan: { loan_amt: @loan.loan_amt, monthly_emi: @loan.monthly_emi, monthly_emi_changable: @loan.monthly_emi_changable, monthly_payment_date: @loan.monthly_payment_date, total_loan_period: @loan.total_loan_period, total_payment: @loan.total_payment } }
    end

    assert_redirected_to loan_url(Loan.last)
  end

  test "should show loan" do
    get loan_url(@loan)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_url(@loan)
    assert_response :success
  end

  test "should update loan" do
    patch loan_url(@loan), params: { loan: { loan_amt: @loan.loan_amt, monthly_emi: @loan.monthly_emi, monthly_emi_changable: @loan.monthly_emi_changable, monthly_payment_date: @loan.monthly_payment_date, total_loan_period: @loan.total_loan_period, total_payment: @loan.total_payment } }
    assert_redirected_to loan_url(@loan)
  end

  test "should destroy loan" do
    assert_difference("Loan.count", -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to loans_url
  end
end
