class DivisionsController < ApplicationController
  def index
    @divisions = Division.all
  end
end