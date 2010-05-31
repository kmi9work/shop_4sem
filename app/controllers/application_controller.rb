# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :user_class

  before_filter :set_user, :errors_validator_start, :actions_filter
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'f0c0446b1a8a8e21995ebb133543cb35'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password

  def actions_filter()
    @actions = self.class.menu_items(user_class())
    @inline_actions = self.class.inline_menu_items(user_class())
  end

  def set_user()
    if params.has_key?('user_name')
      session['user_name'] = params['user_name']
      @user = params['user_name']
    elsif !session['user_name'].nil?
      @user = session['user_name']
      session['user_name'] = @user
    else
      @user = 'anonimus'
      session['user_name'] = @user
    end
  end

  def user_class()
    @user
  end

  def ApplicationController.menu_items(user_class)
    []
  end

  def ApplicationController.inline_menu_items(user_class)
    []
  end

  def errors_validator_start()
    needs_to_validate = session['needs_to_validate']
    @errors = []
    unless needs_to_validate.nil?
      needs_to_validate.each do |i|
        i.each do |k, v|
          @errors << [k, v]
        end
      end
    end
    session['needs_to_validate'] = []
  end

  def needs_to_validate(i)
    @needs_to_validate = [] if @needs_to_validate.nil?
    unless session['needs_to_validate'].nil?
      @needs_to_validate = session['needs_to_validate']
    end
    @needs_to_validate << i.errors if i.errors.size > 0
    session['needs_to_validate'] = @needs_to_validate
  end
end
