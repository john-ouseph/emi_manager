json.extract! loan, :id, :loan_amt, :monthly_emi, :total_loan_period, :total_payment, :monthly_payment_date, :monthly_emi_changable, :created_at, :updated_at
json.url loan_url(loan, format: :json)
