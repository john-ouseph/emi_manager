class EmiPaymentsController < ApplicationController
  before_action :get_loan
  before_action :set_emi_payment, only: %i[ show edit update destroy ]
  after_action :update_loan_details, only: %i[ create update ]

  # GET /emi_payments or /emi_payments.json
  def index
    @emi_payments = @loan.emi_payments
  end

  # GET /emi_payments/1 or /emi_payments/1.json
  def show

  end

  # GET /emi_payments/new
  def new
    @emi_payment = @loan.emi_payments.new
  end

  # GET /emi_payments/1/edit
  def edit

  end

  # POST /emi_payments or /emi_payments.json
  def create
    @emi_payment = @loan.emi_payments.new(emi_payment_attributes)

    respond_to do |format|
      if @emi_payment.save
        format.html { redirect_to loan_emi_payments_path(@loan), notice: "Emi payed successfully for this month." }
        format.json { render :new, status: :created, location: @emi_payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emi_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emi_payments/1 or /emi_payments/1.json
  def update
    respond_to do |format|
      if @emi_payment.update(emi_payment_attributes)
        format.html { redirect_to loan_emi_payment_path(@loan), notice: "Emi payment was successfully updated." }
        format.json { render :show, status: :ok, location: @emi_payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emi_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emi_payments/1 or /emi_payments/1.json
  def destroy
    @emi_payment.destroy

    respond_to do |format|
      format.html { redirect_to loan_emi_payments_url(@loan), notice: "Emi payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emi_payment
      @emi_payment = @loan.emi_payments.find(params[:id])
    end

    def get_loan
      @loan = Loan.find(params[:loan_id])
    end

    def emi_payment_attributes
      emi_payment_attributes = emi_payment_params
      emi_payment_attributes[:intrest_amt] = emi_payment_attributes[:paid_emi_amt].to_f - emi_payment_attributes[:principal_amt].to_f
      emi_payment_attributes[:paid_date] = Date.today
      emi_payment_attributes
    end

    def update_loan_details
      total_paid_amt = @loan.total_paid_amt.nil? ? 0 : @loan.total_paid_amt
      total_paid_principal = @loan.total_paid_principal.nil? ? 0 : @loan.total_paid_principal
      totalr_paid_intrest = @loan.totalr_paid_intrest.nil? ? 0 : @loan.totalr_paid_intrest
      loan_attributes = {total_paid_amt:  total_paid_amt += @emi_payment.paid_emi_amt,
                         total_paid_principal: total_paid_principal += @emi_payment.principal_amt,
                         totalr_paid_intrest: totalr_paid_intrest += @emi_payment.intrest_amt}
      loan_attributes.merge!({remaining_total_amt: @loan.total_payment - loan_attributes[:total_paid_amt].to_f})
      @loan.update(loan_attributes)
    end
    # Only allow a list of trusted parameters through.
    def emi_payment_params
      params.require(:emi_payment).permit(:paid_emi_amt, :emi_amt, :principal_amt, :loan_id)
    end
end
