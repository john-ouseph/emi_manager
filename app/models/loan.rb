class Loan < ApplicationRecord
  has_many :emi_payments, dependent: :destroy
  validates :loan_amt, presence: true
end
