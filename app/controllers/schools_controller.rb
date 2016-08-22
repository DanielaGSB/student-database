class SchoolsController < ApplicationController
  def index
    @schools = School.all.order('name ASC')
  end

  def show
    @school = School.find(params[:id])
  end
end
