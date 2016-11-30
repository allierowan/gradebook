class GradesController < ApplicationController
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to "/", alert: "You don't have access to this action"
  end

  def new
    @student = Student.find(params[:student_id])
    @grade = Grade.new()
  end

  def create
    @student = Student.find(params[:student_id])
    @grade = @student.grades.new(grade_params)
    if @grade.save
      redirect_to @student
    else
      render :new
    end
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def update
    @grade = Grade.find(params[:id])
    if @grade.update(grade_params)
      redirect_to @grade.student
    else
      render :edit
    end
  end

  def grade_params
    params.require(:grade).permit(:assignment_name, :due_at, :value)
  end

  def destroy
    Grade.find(params[:id]).destroy
    redirect_to Student.find(params[:student_id])
  end
end
