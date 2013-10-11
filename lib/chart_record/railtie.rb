require 'chart_record/extensions'
module ChartRecord
  class Railtie < Rails::Railtie
    initializer "chart_record.extensions" do
      ActionView::Base.send :include, Extensions
    end
  end
end