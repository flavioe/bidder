# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
 
  before_filter :authorize, :except => :login
  
  session :session_key => '_bidder_session_id'

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => 'c068028963aaad28e89ccba985b8a91e',:only => [:create, :update, :destroy]
 
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

#  protected
#    def authorize
#      unless User.find_by_id(session[:user_id])
#        session[:original_uri] = request.request_uri
#        flash[:notice] = "Por favor logue"
#        redirect_to :controller => :vendedor, :action => :login
#      end
#    end
end
