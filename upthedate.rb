class UTDMonthDay
  def initialize(day, month)
    @day = day; @month = month.new.to_i
  end

  def /(year)
    DateTime.new(year, @month, @day)
  end
end

class Fixnum
  alias_method :old_division, :/
  def /(n)
    if n.respond_to?(:superclass) && n.superclass == UTDMonth
      UTDMonthDay.new(self, n)
    else
      old_division n
    end
  end
end

class UTDMonth
  def to_i
    DateTime::ABBR_MONTHNAMES.find_index self.class
  end
end

class Jan < UTDMonth
end

class Feb < UTDMonth
end

class May < UTDMonth
end

class March < UTDMonth
end
