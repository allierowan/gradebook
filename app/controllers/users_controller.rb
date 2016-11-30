class UsersController < ApplicationController
  def new
    @user = User.new()
  end

  def create
    @user = User.new()
    @user.personable = find_person if find_person
    if @user.save
      session["current_user_id"] = @user.id
      path_redirect(@user.personable_id, @user.personable_type)
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

  def path_redirect(id, personable_type)
    redirect_to send("#{personable_type.downcase}_path", id)
  end
end
