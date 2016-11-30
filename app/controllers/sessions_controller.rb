class SessionsController < ApplicationController
    def new
    end

    def create
      @user = User.find_by(email: params[:email])
      if @user && @user.password == params[:password]
        session["current_user_id"] = @user.id
        path_redirect(@user.personable_id, @user.personable_type)
      else
        @message = "You username or password was not correct"
        render :new
      end
    end

    def destroy
      session.delete("current_user_id")
      redirect_to shares_path
    end

    def path_redirect(id, personable_type)
      redirect_to send("#{personable_type.downcase}_path", id)
    end
end
