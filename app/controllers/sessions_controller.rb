class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    if params[:name].empty?
      redirect_to(controller: 'sessions', action: 'new')
    else
      session[:name] = params[:name]
      redirect_to(controller: 'application', action: 'hello')
    end
  end

  def destroy
    if !current_user
      redirect_to '/sessions/login'
    else
      session.delete :name
      redirect_to(controller: 'sessions', action: 'new')
    end
  end

end
