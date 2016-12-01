class ParentsController < ApplicationController
  load_and_authorize_resource

  def new
    @student = Student.find(params["student_id"])
    @parent = Parent.new()
  end

  def create
    @student = Student.find(params["parent"]["student_id"])
    @parent = @student.parents.build(parent_params)
    if @parent.save
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

  def parent_params
    params.require(:parent).permit(:full_name, :email)
  end
end
