class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  # i18n configuration. See: http://guides.rubyonrails.org/i18n.html
  before_action :set_locale

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: locale }
  end

  # for devise to redirect with locale
  def self.default_url_options(options = {})
    options.merge(locale: I18n.locale)
  end

  def index; end

  def record_not_found
    render json: { error: t('application.messages.alerts.record_not_found') }, status: :not_found
  end
end
