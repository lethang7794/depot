class ApplicationController < ActionController::Base
  # before_action :set_time
  #
  # def set_time
  #   @time = Time.now
  # end

  @time = Time.now

  def self.time
    @time
  end
end
