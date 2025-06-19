class DebtsController < ApplicationController
  before_action :set_debt, only: %i[ show update destroy ]

  # GET /debts
  def index
    @debts = current_user.debts.all

    render json: DebtSerializer.new(@debts).serializable_hash.to_json
  end

  # GET /debts/1
  def show
    render json: DebtSerializer.new(@debt).serializable_hash.to_json
  end

  # POST /debts
  def create
    @debt = current_user.debts.new(debt_params)

    if @debt.save
      render json: DebtSerializer.new(@debt), status: :created
    else
      render json: @debt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /debts/1
  def update
    if @debt.update(debt_params)
      render json: @debt
    else
      render json: @debt.errors, status: :unprocessable_entity
    end
  end

  # DELETE /debts/1
  def destroy
    @debt.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debt
      @debt = current_user.debts.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def debt_params
      params.require(:debt).permit(:name, :original_balance, :current_balance, :apr, :original_term, :minimum_payment)
    end
end
