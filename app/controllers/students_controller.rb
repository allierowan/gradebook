class StudentsController < ApplicationController
  def new
    @student = Student.new()
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to "/"
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def student_params
    params.require(:student).permit(:full_name, :email)
  end
end
