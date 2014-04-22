class WorkshopsController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
    @workshops = Workshop.all
  end
end
