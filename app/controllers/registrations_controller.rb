class RegistrationsController < ApplicationController
  def index
    @registrations = Registration.all.order('id DESC')
    @registration = Registration.new
    @branches = Branch.all
  end

  def new
    @registration = Registration.new
    @branches = Branch.all
  end

  def create
    @branches = Branch.all
    @registration = Registration.create(registration_params)
    if @registration.valid?
      redirect_to registrations_path
    else
      @registrations = Registration.all.order('id DESC')
      render :index
    end
  end

  def edit
    @registration = Registration.find(params[:id])
    @branches = Branch.all
  end

  def update
    @registration = Registration.find(params[:id])

    if @registration.update(registration_params)
      redirect_to registrations_path
    else
      render :edit
    end
  end

  def destroy
    @registration = Registration.find (params[:id])
    @registration.destroy
    redirect_to registrations_path
  end

  private

  def registration_params
    params.require(:registration).permit(:start_date, :end_date, :consumption_data, :verified, :branch_id)
  end
end
