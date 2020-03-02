class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
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

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { locale: I18n.locale }
    end
end
