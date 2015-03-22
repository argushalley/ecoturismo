class Admin::TransactionsController < ApplicationController
  before_filter :authenticate_user!

  respond_to :html

  def index
    authorize! :read, Transaction

    @transactions = Transaction.all.decorate

    respond_to do |format|
      format.html
    end
  end

  def show
    authorize! :read, Transaction
    @transaction = Transaction.find(params[:id])
  end

  def new
    authorize! :create, Transaction
    @transaction = Transaction.new
  end

  def create
    binding.pry
    authorize! :create, Transaction
    @user = User.find(transaction_params[:user_id])
    @transaction = @user.transactions.build(transaction_params)

    if @transaction.save
      respond_with @transaction, location: [:admin, @transaction]
    else
      render 'new'
    end
  end

  def edit
    authorize! :update, Transaction

    @transaction = Transaction.find(params[:id])
  end

  def update
    authorize! :update, Transaction

    @transaction = Transaction.find(params[:id])
    @transaction.update_attributes(transaction_params)
    respond_with @transaction, location: [:admin, @transaction]
  end

  def destroy
    authorize! :destroy, Transaction

    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    redirect_to admin_transactions_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(
      :description, :type, :compensated, :value, :user_id
    )
  end
end
