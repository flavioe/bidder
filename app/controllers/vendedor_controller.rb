class VendedorController < ApplicationController
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user and (user.role == "Vendedor" or user.role == "Vendedor/Comprador")
        session[:user_id] = user.id
        session[:role] = user.role
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || { :action => "index" })
      else
        flash.now[:notice] = "Usuário de Vendedor e/ou senha errados."
        #redirect_to(:action => :login)
      end
    end
  end

  def logout
  end

  def index
  end

  protected
    def authorize
      unless User.find_by_id(session[:user_id]) and (session[:role] == "Vendedor" or session[:role] == "Vendedor/Comprador")
        session[:original_uri] = request.request_uri
        flash[:notice] = "Por favor logue"
        redirect_to :controller => :vendedor, :action => :login
      end
    end
end
