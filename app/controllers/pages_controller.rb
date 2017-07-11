class PagesController < ApplicationController
  respond_to :html

  def show
    @page = Page.find_by(url: params[:url])
    if @page.present? && @page.active
      respond_with(@page)
    else
      render_404
    end
  end

  private

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
end
