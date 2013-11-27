class ApplicationController < ActionController::Base
	define_method('communication-systems') do
  	end

  	define_method('tire-pressure-monitoring') do
  	end

  	define_method('advanced-remote-controls') do
  	end

  	define_method('sensor-networks') do
  	end

  	define_method('wirless-health-monitors') do
  	end

  	define_method('wirless-industrial-control') do
  	end

  	define_method('remote-control-toys') do
  	end

  	define_method('home-automation-security-n-alarm') do
  	end

  	define_method('wireless-pc-peripherals') do
  	end

  	define_method('smart-meters') do
  	end

    before_filter :set_locale
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def default_url_options(options={})
      { locale: I18n.locale }
    end
end
