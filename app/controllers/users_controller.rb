class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    @user.personable = find_person if find_person
    if !find_person
      flash[:danger] = "You have not been added to the roster yet"
    elsif @user.save
      session["current_user_id"] = @user.id
      redirect_to @user.personable
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def find_person
    Student.find_by(email: params[:user][:email]) || Parent.find_by(email: params[:user][:email]) || Teacher.find_by(email: params[:user][:email])
  end
end
