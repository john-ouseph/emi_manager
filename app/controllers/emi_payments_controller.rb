class EmiPaymentsController < ApplicationController
  before_action :set_emi_payment, only: %i[ show edit update destroy ]
  before_action :set_loan, only: %i[index new]

  # GET /emi_payments or /emi_payments.json
  def index
    @emi_payments = @loan.emi_payments
  end

  # GET /emi_payments/1 or /emi_payments/1.json
  def show
    binding.pry
  end

  # GET /emi_payments/new
  def new
    @emi_payment = EmiPayment.new
  end

  # GET /emi_payments/1/edit
  def edit

  end

  # POST /emi_payments or /emi_payments.json
  def create
    @emi_payment = EmiPayment.new(emi_payment_params)

    respond_to do |format|
      if @emi_payment.save
        format.html { redirect_to loans_url, notice: "Emi payed successfully for this month." }
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
      if @emi_payment.update(emi_payment_params)
        format.html { redirect_to emi_payment_url(@emi_payment), notice: "Emi payment was successfully updated." }
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
      format.html { redirect_to emi_payments_url, notice: "Emi payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emi_payment
      @emi_payment = EmiPayment.find(params[:id])
    end

    def set_loan
      @loan = Loan.find(params[:loan_id] || @emi_payment.loan_id)
    end

    # Only allow a list of trusted parameters through.
    def emi_payment_params
      params.require(:emi_payment).permit(:paid_emi_amt, :emi_amt, :principal_amt, :loan_id)
    end
end
