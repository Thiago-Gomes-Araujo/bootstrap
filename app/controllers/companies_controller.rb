class CompaniesController < ApplicationController

  def new
    @company = current_user.build_company
  end

  def edit
    @company = current_user.company
  end

  def create
    @company = current_user.build_company(company_params)
    respond_to do |f|
      if @company.save
        f.html { redirect_to root_path, notice: "Empresa Cadastrada com Sucesso" }
      else
        f.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @company = current_user.company
    respond_to do |f|
      if @company.update(company_params)
        f.html { redirect_to edit_company_path(@company), notice: "Empresa Atualizada com Sucesso" }
      else
        f.html { render :edit, status: :unprocessable_entity }
      end
    end
  end
  private
  def company_params
    params.require(:company).permit(:name, :url, :logo)
  end
end
