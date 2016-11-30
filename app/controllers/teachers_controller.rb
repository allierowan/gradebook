class TeachersController < ApplicationController
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to "/", alert: "You don't have access to this action"
  end

  def new
    @teacher = Teacher.new()
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to teacher_path(current_user.personable_id)
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
