class ParentsController < ApplicationController
  def new
    @parent = Parent.new()
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
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

  def parent_params
    params.require(:parent).permit(:full_name, :email)
  end
end
