module HomeHelper
    def month_offset(date)
        # you might want to update this based on your first day of the week (Sun/Mon)
        date.beginning_of_month.wday - 1
      end
    
      def today?(day)
        day == Date.today
      end
    
      def today_class(day)
        "bg-rose-200" if today?(day)
      end


end
