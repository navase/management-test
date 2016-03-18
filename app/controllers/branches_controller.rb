class BranchesController < ApplicationController
  def index
    @branches = Branch.all
  end

  def new
    @branch = Branch.new
  end

  def create
    @branch = Branch.create(branch_params)
    if @branch.valid?
      redirect_to branches_path
    else
      render :new
    end
  end

  def edit
    @branch = Branch.find(params[:id])
  end

  def update
    @branch = Branch.find(params[:id])

    if @branch.update(branch_params)
      redirect_to branches_path
    else
      render :edit
    end
  end

  def destroy
    @branch = Branch.find (params[:id])
    @branch.destroy
    redirect_to branches_path
  end

  private

  def branch_params
    params.require(:branch).permit(:name)
  end
end
