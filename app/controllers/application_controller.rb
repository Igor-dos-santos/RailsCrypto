class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead. :exception
    protect_from_forgery with: :null_session    
end
