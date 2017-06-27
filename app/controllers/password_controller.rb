class PasswordController < ApplicationController
  def password
    @idm = 0
    @pwm = 0
    @id = params[:user]
    @password = params[:password]
    if @password.present? && @id.present?
      if @id.match (/^(?=.*[A-Za-z])[A-Za-z]{1,10}$/)
        flash.now[:error] = "Your id is accepted"
        @idm = 1
        cookies[:user] = @id
      elsif
        flash.now[:error] = "Please enter a valid ID"
      end
      if @password.match (/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/)
        flash.now[:error1] = "Your password is accepted"
        @pwm = 1
      elsif
        flash.now[:error1] = "Please enter a valid password"
      end
      if @pwm == 1 && @idm == 1
        redirect_to controller: 'information', action: 'info'
      end
    end
    # render "password.html.erb"
  end
end
