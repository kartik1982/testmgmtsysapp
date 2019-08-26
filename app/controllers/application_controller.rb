class ApplicationController < ActionController::Base
  before_action :require_user
  include ApplicationHelper
  include UserHelper

end
