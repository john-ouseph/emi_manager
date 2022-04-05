json.extract! emi_payment, :id, :paid_emi_amt, :emi_amt, :principal_amt, :created_at, :updated_at
json.url emi_payment_url(emi_payment, format: :json)
