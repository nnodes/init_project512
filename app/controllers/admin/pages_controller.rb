module Admin
  class PagesController < AdminController
    before_action :set_page, only: [:show, :edit, :update, :destroy]

    def index
      @pages = Page.all
    end

    def show
    end

    def edit
    end

    def create
      @page = Page.new(page_params)

      respond_to do |format|
        if @page.save
          format.html { redirect_to admin_pages_path, notice: 'Página creada exitosamente' }
          format.json { render :show, status: :created, location: @page }
        else
          format.html { render :new }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @page.update(page_params)
          format.html { redirect_to admin_pages_path, notice: 'Página actualizada exitosamente' }
          format.json { render :show, status: :ok, location: @page }
        else
          format.html { render :edit }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      respond_to do |format|
        if @page.home_page
          @page.destroy
          format.html { redirect_to admin_pages_url, notice: 'Página eliminada exitosamente' }
          format.json { head :no_content }
        else
          format.html { redirect_to admin_pages_url, notice: 'Esta página no puede ser eliminada' }
          format.json { head :no_content }
        end
      end
    end

    private

    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page)
            .permit(:title, :active, :content, :url, :user_id)
    end
  end
end
