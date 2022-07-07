class Agenciescontroller < ApplicationController
  def index
    @agencies = Agency.all
  end

  def show
    
  end
end