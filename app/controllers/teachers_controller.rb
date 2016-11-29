class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new()
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
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

  def teacher_params
    params.require(:teacher).permit(:full_name, :email)
  end
end
