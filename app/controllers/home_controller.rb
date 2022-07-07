class HomeController < ApplicationController
  def index
    @cases = Case.all
  end
end