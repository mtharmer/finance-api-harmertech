# frozen_string_literal: true

class MonthlyExpensesController < ApplicationController
  before_action :set_monthly_expense, only: %i[show update destroy]

  # GET /monthly_expenses
  def index
    @monthly_expenses = current_user.monthly_expenses.all

    render json: MonthlyExpenseSerializer.new(@monthly_expenses).serializable_hash.to_json
  end

  # GET /monthly_expenses/1
  def show
    render json: MonthlyExpenseSerializer.new(@monthly_expense).serializable_hash.to_json
  end

  # POST /monthly_expenses
  def create
    @monthly_expense = current_user.monthly_expenses.new(monthly_expense_params)

    if @monthly_expense.save
      render json: MonthlyExpenseSerializer.new(@monthly_expense).serializable_hash.to_json, status: :created
    else
      render json: @monthly_expense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /monthly_expenses/1
  def update
    if @monthly_expense.update(monthly_expense_params)
      render json: MonthlyExpenseSerializer.new(@monthly_expense).serializable_hash.to_json
    else
      render json: @monthly_expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /monthly_expenses/1
  def destroy
    @monthly_expense.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_monthly_expense
    @monthly_expense = current_user.monthly_expenses.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def monthly_expense_params
    params.require(:monthly_expense).permit(:name, :amount, :expense_type, :due_day)
  end
end
