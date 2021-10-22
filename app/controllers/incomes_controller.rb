class IncomesController < ApplicationController
  before_action :set_income, only: %i[show edit update destroy]
  after_action :inc_balance, only: %i[create]
  after_action :dec_balance, only: %i[destroy]

  # GET /incomes or /incomes.json
  def index
    @incomes = Income.all
  end

  # GET /incomes/1 or /incomes/1.json
  def show; end

  # GET /incomes/new
  def new
    @income = Income.new
  end

  # GET /incomes/1/edit
  def edit; end

  # POST /incomes or /incomes.json
  def create
    @income = Income.new(income_params)
    @income.user = current_user

    respond_to do |format|
      if @income.save
        format.html { redirect_to incomes_path, notice: 'Income was successfully created.' }
        format.json { render :show, status: :created, location: @income }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /incomes/1 or /incomes/1.json
  def update
    respond_to do |format|
      if @income.update(income_params)
        format.html { redirect_to incomes_path, notice: 'Income was successfully updated.' }
        format.json { render :show, status: :ok, location: @income }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1 or /incomes/1.json
  def destroy
    @income.destroy
    respond_to do |format|
      format.html { redirect_to incomes_url, notice: 'Income was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_income
    @income = Income.find(params[:id])
  end

  def income_params
    params.require(:income).permit(:income_category_id, :amount)
  end

  def inc_balance
    current_user.balance.update(value: current_user.balance.value + @income.amount) if @income.valid?
  end

  def dec_balance
    current_user.balance.update(value: current_user.balance.value - @income.amount) if @income.valid?
  end
end
