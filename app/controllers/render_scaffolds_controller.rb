class RenderScaffoldsController < ApplicationController
  before_action :set_render_scaffold, only: [:show, :edit, :update, :destroy]

  # GET /render_scaffolds
  # GET /render_scaffolds.json
  def index
    @render_scaffolds = RenderScaffold.all
  end

  # GET /render_scaffolds/1
  # GET /render_scaffolds/1.json
  def show
  end

  # GET /render_scaffolds/new
  def new
    @render_scaffold = RenderScaffold.new
  end

  # GET /render_scaffolds/1/edit
  def edit
  end

  # POST /render_scaffolds
  # POST /render_scaffolds.json
  def create
    @render_scaffold = RenderScaffold.new(render_scaffold_params)

    respond_to do |format|
      if @render_scaffold.save
        format.html { redirect_to @render_scaffold, notice: 'Render scaffold was successfully created.' }
        format.json { render :show, status: :created, location: @render_scaffold }
      else
        format.html { render :new }
        format.json { render json: @render_scaffold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /render_scaffolds/1
  # PATCH/PUT /render_scaffolds/1.json
  def update
    respond_to do |format|
      if @render_scaffold.update(render_scaffold_params)
        format.html { redirect_to @render_scaffold, notice: 'Render scaffold was successfully updated.' }
        format.json { render :show, status: :ok, location: @render_scaffold }
      else
        format.html { render :edit }
        format.json { render json: @render_scaffold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /render_scaffolds/1
  # DELETE /render_scaffolds/1.json
  def destroy
    @render_scaffold.destroy
    respond_to do |format|
      format.html { redirect_to render_scaffolds_url, notice: 'Render scaffold was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_render_scaffold
      @render_scaffold = RenderScaffold.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def render_scaffold_params
      params.require(:render_scaffold).permit(:titulo, :contenido, :user_id)
    end
end
