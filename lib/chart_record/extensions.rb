module ChartRecord
  module Extensions

    extend ActiveSupport::Concern

    module ClassMethods

      def self.in_the_past_x_days x = 14
        where("#{self.table_name}.created_at > ?", x.days.ago)
        .group("DATE(#{self.table_name}.created_at)")
      end

      def self.daily_count_with_zeros num_days, additional_queries = nil
        grouped = self.in_the_past_x_days(num_days)
        if additional_queries
          aq = additional_queries.split(".")
          aq.each do |q|
            grouped = grouped.send(q)
          end
        end
        grouped = grouped.count
        (0...num_days).each do |n|
          day = n.days.ago.strftime("%Y-%m-%d")
          grouped[day] = 0 unless grouped.has_key?(day)
        end
        return grouped
      end

    end
  end
end