class FactsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @facts = Fact.all 
    @fact = Fact.new
  end

  def new
    @fact = Fact.new
  end

  def create
    @fact = current_user.facts.new(fact_params)
    respond_to do |format|
      if @fact.save
        format.html { redirect_to facts_path, notice: 'flip card was successfully created.' }
        format.json { render action: 'index', status: :created, location: @fact }
      else
        format.html { render action: 'new' }
        format.json { render json: @fact.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @fact = Fact.find(params[:id])
  end

  private
  def fact_params
    params.require(:fact).permit(:question, :answer)
  end
end
