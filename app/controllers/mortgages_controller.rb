class MortgagesController < ApplicationController
  before_action :set_mortgage, only: %i[ show update destroy ]

  # GET /mortgages
  def show
    render json: MortgageSerializer.new(@mortgage).serializable_hash.to_json
  end

  # POST /mortgages
  def create
    @mortgage = current_user.mortgage = Mortgage.new(mortgage_params)

    if @mortgage.save
      render json: MortgageSerializer.new(@mortgage).serializable_hash.to_json, status: :created
    else
      render json: @mortgage.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mortgages/1
  def update
    if @mortgage.update(mortgage_params)
      render json: MortgageSerializer.new(@mortgage).serializable_hash.to_json
    else
      render json: @mortgage.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mortgages/1
  def destroy
    @mortgage.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mortgage
      @mortgage = current_user.mortgage
    end

    # Only allow a list of trusted parameters through.
    def mortgage_params
      params.require(:mortgage).permit(:original_balance, :down_payment, :original_balance_after_down_payment, :current_balance,
                                       :apr, :term, :payment, :tax, :insurance,
                                       :pmi, :extra_payment, :original_interest, :remaining_interest, :remaining_term,
                                       :original_interest_after_extra, :remaining_interest_after_extra, 
                                       :remaining_term_after_extra, :user_id)
    end
end
