class PositionsController < ApplicationController
  before_action :set_company
  def index
    @positions = @company.positions
  end

  def new
    @position = @company.positions.new
  end

  def edit
  end

  def show
  end

  private

  def set_company
    @company = current_user.company
  end

end
