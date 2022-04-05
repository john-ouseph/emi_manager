require "test_helper"

class EmiPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @emi_payment = emi_payments(:one)
  end

  test "should get index" do
    get emi_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_emi_payment_url
    assert_response :success
  end

  test "should create emi_payment" do
    assert_difference("EmiPayment.count") do
      post emi_payments_url, params: { emi_payment: { emi_amt: @emi_payment.emi_amt, paid_emi_amt: @emi_payment.paid_emi_amt, principal_amt: @emi_payment.principal_amt } }
    end

    assert_redirected_to emi_payment_url(EmiPayment.last)
  end

  test "should show emi_payment" do
    get emi_payment_url(@emi_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_emi_payment_url(@emi_payment)
    assert_response :success
  end

  test "should update emi_payment" do
    patch emi_payment_url(@emi_payment), params: { emi_payment: { emi_amt: @emi_payment.emi_amt, paid_emi_amt: @emi_payment.paid_emi_amt, principal_amt: @emi_payment.principal_amt } }
    assert_redirected_to emi_payment_url(@emi_payment)
  end

  test "should destroy emi_payment" do
    assert_difference("EmiPayment.count", -1) do
      delete emi_payment_url(@emi_payment)
    end

    assert_redirected_to emi_payments_url
  end
end
