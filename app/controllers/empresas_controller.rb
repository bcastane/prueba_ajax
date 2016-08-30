class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show]

  # GET /empresas
  # GET /empresas.json
  def index
    @empresas = Empresa.all

   # @mayores_empresas= Empresa.includes(:reclamos).all.group("reclamos.empresa_id","empresas.nombre").order('count(reclamos) desc')
   # byebug
   @mayores_empresas= Empresa.includes(:reclamos)
 .group(:nombre, :empresa_id)
 .pluck("empresas.nombre", "count(reclamos.id)")

 byebug
    #byebug
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
    @reclamos_por_dia= @empresa.reclamos.group_by_day(:created_at).count
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit

     respond_to do |format|
      format.js
     end

  end

  # POST /empresas
  # POST /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to @empresa, notice: 'Empresa was successfully created.' }
        format.json { render :show, status: :created, location: @empresa }
        format.js
      else
        format.html { render :new }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /empresas/1
  # PATCH/PUT /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to @empresa, notice: 'Empresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @empresa }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    @empresa.destroy
    respond_to do |format|
      format.html { redirect_to empresas_url, notice: 'Empresa was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_params
      params.require(:empresa).permit(:nombre, :rubro)
    end
end
