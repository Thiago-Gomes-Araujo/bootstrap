class PositionsController < ApplicationController
  before_action :set_company  # Exclui create do before_action
  before_action :set_position, only: [:show, :edit, :update, :destroy]  # Adiciona set_position para show, edit, update, destroy

  def index
    @positions = @company.positions
    @q = @positions.ransack(params[:q])
    #@positions = @q.result.includes(:articles).page(params[:page])
  end

  def new
    @position = @company.positions.new
  end

  def edit
  end

  def create
    @position = @company.positions.create(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to positions_path, notice: "Nova Vaga Cadastrada com Sucesso." }
        format.json { render :index, status: :created, location: @position }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @position.destroy!

    respond_to do |format|
      format.html { redirect_to positions_path, notice: "Vaga Exluida com Sucesso." }
      format.json { head :no_content }
    end
  end


    
  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to positions_path, notice: "Vaga atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @position.errors, status: :unprocessable_entity }
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