class HomeController < ApplicationController
  skip_authorization_check

  def landing
    @slides = Slide.where(active: true).order(position: :desc)
  end

  def index
    @slides = Slide.where(active: true).order(position: :desc)
  end
end
