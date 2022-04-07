class AddEmiPaymentsCountToLoan < ActiveRecord::Migration[7.0]
  def change
    add_column :loans, :emi_payments_count, :integer, default: 0
  end
end
