class ApplicationController < ActionController::Base

before_action :set_test_app, only: %i [ show edit update destory ]
before_action :authenticate_user!

end
