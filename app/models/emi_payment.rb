class EmiPayment < ApplicationRecord
  belongs_to :loan, counter_cache: true
  validates :emi_amt, presence: true
end
