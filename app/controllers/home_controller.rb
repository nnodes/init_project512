class HomeController < ApplicationController
  skip_authorization_check

  def landing
    @slides = Slide.all
  end

  def index
    @slides = Slide.all
  end
end
