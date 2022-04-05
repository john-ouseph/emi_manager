class CreateEmiPayments < ActiveRecord::Migration[7.0]
  def change
    create_table :emi_payments do |t|
      t.integer :loan_id
      t.float :paid_emi_amt
      t.float :emi_amt
      t.float :principal_amt
      t.date :paid_date
      t.float :intrest_amt
      t.timestamps
    end
  end
end
