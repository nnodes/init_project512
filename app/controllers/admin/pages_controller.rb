module Admin
  class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy, :reservations]

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
          format.html { redirect_to admin_page_path(@page), notice: 'Página creada exitosamente' }
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
          format.html { redirect_to admin_page_path(@page), notice: 'Usuario actualizado exitosamente' }
          format.json { render :show, status: :ok, location: @page }
        else
          format.html { render :edit }
          format.json { render json: @page.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @page.destroy
      respond_to do |format|
        format.html { redirect_to admin_pages_url, notice: 'Usuario eliminado exitosamente' }
        format.json { head :no_content }
      end
    end

    private

    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page)
            .permit(:title, :active, :content, :url, :user_id, :image)
    end
  end
end
