# Welcome Controller
class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
  end

  def how_it_works
  end

  def about_us
  end
end
