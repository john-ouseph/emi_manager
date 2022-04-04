class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.float :loan_amt
      t.float :monthly_emi
      t.integer :total_loan_period
      t.float :total_payment
      t.date :monthly_payment_date
      t.boolean :monthly_emi_changable
      t.integer :total_paid_period
      t.float :total_paid_amt
      t.float :total_paid_principal
      t.float :totalr_paid_intrest
      t.float :remaining_total_amt
      t.float :remaining_principlal_amt
      t.timestamps
    end
  end
end
