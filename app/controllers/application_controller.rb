class ApplicationController < ActionController::Base
  before_action :initialize_session
  before_action :increment_visit_count

  private

  def initialize_session
    session[:visit_count] ||= 0
  end

  def increment_visit_count
    session[:visit_count] += 1
    @visit_count = session[:visit_count]
  end
end
