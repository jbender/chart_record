require 'dd_active_record_extensions/extensions'
module EngineUrlHelpers
  class Railtie < Rails::Railtie
    initializer "dd_active_record_extensions.extensions" do
      ActionView::Base.send :include, Extensions
    end
  end
end