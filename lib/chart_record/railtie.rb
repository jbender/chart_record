require 'chart_record/extensions'
module ChartRecord
  class Railtie < ::Rails::Railtie
    initializer "chart_record.extensions" do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :include, Extensions
      end
    end
  end
end
