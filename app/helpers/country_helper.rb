module CountryHelper
  def pretty_attribute(name)
    case name
    when /(id|gnp)/i
      name.upcase
    else
      name.humanize
    end
  end

  def pretty_value(value)
    case value
    when nil, ''
      '-'
    else
      value
    end
  end
end
