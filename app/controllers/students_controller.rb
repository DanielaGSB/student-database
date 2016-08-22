class StudentsController < ApplicationController
  def index
    @students = Student.all.order('name ASC')
  end

  def new
    @schools = School.all
    @student = Student.new
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = 'Student deleted successfully'
    redirect_to '/'
  end

  def edit
    @schools = School.all
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params)
    redirect_to '/'
  end

  def create
    @schools = School.all
    @student = Student.new(student_params)
    if @student.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :school_id, school_ids: [])
  end
end
