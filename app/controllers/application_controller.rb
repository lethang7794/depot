class ApplicationController < ActionController::Base
  before_action :authorize
  # before_action :set_time
  #
  # def set_time
  #   @time = Time.now
  # end

  @time = Time.now

  def self.time
    @time
  end

  protected
    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to '/login', notice: "You need to log in to access this page."
      end
    end
end
