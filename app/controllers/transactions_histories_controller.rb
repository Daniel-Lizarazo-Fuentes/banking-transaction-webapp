class TransactionsHistoriesController < ApplicationController
  before_action :set_transactions_history, only: %i[ show edit update destroy ]

  # GET /transactions_histories or /transactions_histories.json
  def index
    @transactions_histories = TransactionsHistory.all
  end

  # GET /transactions_histories/1 or /transactions_histories/1.json
  def show
  end

  # GET /transactions_histories/new
  def new
    @transactions_history = TransactionsHistory.new
  end

  # GET /transactions_histories/1/edit
  def edit
  end

  # POST /transactions_histories or /transactions_histories.json
  def create
    @transactions_history = TransactionsHistory.new(transactions_history_params)

    respond_to do |format|
      if @transactions_history.save
        format.html { redirect_to @transactions_history, notice: "Transactions history was successfully created." }
        format.json { render :show, status: :created, location: @transactions_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transactions_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions_histories/1 or /transactions_histories/1.json
  def update
    respond_to do |format|
      if @transactions_history.update(transactions_history_params)
        format.html { redirect_to @transactions_history, notice: "Transactions history was successfully updated." }
        format.json { render :show, status: :ok, location: @transactions_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transactions_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions_histories/1 or /transactions_histories/1.json
  def destroy
    @transactions_history.destroy
    respond_to do |format|
      format.html { redirect_to transactions_histories_url, notice: "Transactions history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transactions_history
      @transactions_history = TransactionsHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transactions_history_params
      params.require(:transactions_history).permit(:transaction_date, :bank_account, :contra_account, :contra_account_owner, :amount, :currency, :funding_type, :desc)
    end
end
