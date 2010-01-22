class UTDMonthDay
  def initialize(day, month)
    @day = day; @month = month.new.to_i
  end

  def /(year)
    DateTime.new(year, @month, @day)
  end
end

class Fixnum
  alias_method :old_minus, :/
  def /(n)
    if n.respond_to?(:superclass) && n.superclass == UTDMonth
      UTDMonthDay.new(self, n)
    else
      old_minus n
    end
  end
end

class UTDMonth
  def to_i
    DateTime::ABBR_MONTHNAMES.find_index self.class.to_s
  end
end

for month in DateTime::ABBR_MONTHNAMES
  next if !month
  month_class = Class.new UTDMonth
  Object.const_set month, month_class
end

