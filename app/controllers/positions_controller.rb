class PositionsController < ApplicationController
  before_action :set_company  # Exclui create do before_action
  before_action :set_position, only: [:show, :edit, :update, :destroy]  # Adiciona set_position para show, edit, update, destroy

  def index
    @q = @company.positions.includes(:career, :contract, :type_vacancy, :state).ransack(params[:q])
    
    if params[:q].present? && params[:q][:contract_name_cont].present?
      @pagy, @positions = pagy(Position.where(company_id: current_user.company.id).joins(:contract).merge(Contract.where("contracts.name ILIKE ?", "%#{params[:q][:contract_name_cont]}%")))
    else
      @pagy, @positions = pagy(@q.result(distinct: true))
    end
    
    #@positions = @q.result.includes(:articles).page(params[:page])
  end

  def new
    @position = @company.positions.new
  end

  def edit
  end

  def create
    @position = @company.positions.create(position_params)

    respond_to do |f|
      if @position.save
        f.html { redirect_to positions_path, notice: "Nova Vaga Cadastrada com Sucesso." }
        f.json { render :index, status: :created, location: @position }
      else
        f.html { render :new, status: :unprocessable_entity }
        f.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @position.destroy!

    respond_to do |f|
      f.html { redirect_to positions_path, notice: "Vaga Exluida com Sucesso." }
      f.json { head :no_content }
    end
  end


    
  def update
    respond_to do |f|
      if @position.update(position_params)
        f.html { redirect_to positions_path, notice: "Vaga atualizada com sucesso." }
        f.json { render :show, status: :ok, location: @position }
      else
        f.html { render :edit, status: :unprocessable_entity }
        f.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  private

  def set_company
    @company = current_user.company
  end

  def set_position
    @position = Position.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def position_params
    params.require(:position).permit(:name, :career_id, :contract_id, :type_vacancy_id, :publish, :city, :state_id, :summary, :description)
  end
end