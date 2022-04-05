class Loan < ApplicationRecord
  has_many :emi_payments
end
