module OrdersHelper
    def format_condition(condition)
        words = condition.split("_").map do |w|
            w.capitalize
        end
        words.join(" ")
    end
end
