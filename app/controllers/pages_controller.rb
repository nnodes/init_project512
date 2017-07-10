class PagesController < ApplicationController
  respond_to :html
  skip_authorization_check

  def show
    @page = Page.find_by(url: params[:url])
    if @page.present?
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
