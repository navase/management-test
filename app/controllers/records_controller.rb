class RecordsController < ApplicationController
  def index
    @records = Record.all.order('id DESC')
    @record = Record.new
    @branches = Branch.all
  end

  def new
    @record = Record.new
    @branches = Branch.all
  end

  def create
    @branches = Branch.all
    @record = Record.create(record_params)
    if @record.valid?
      redirect_to records_path
    else
      @records = Record.all.order('id DESC')
      render :index
    end
  end

  def edit
    @record = Record.find(params[:id])
    @branches = Branch.all
  end

  def update
    @record = Record.find(params[:id])

    if @record.update(record_params)
      redirect_to records_path
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find (params[:id])
    @record.destroy
    redirect_to records_path
  end

  private

  def record_params
    params.require(:record).permit(:start_date, :end_date, :consumption_data, :verified, :branch_id)
  end
end
