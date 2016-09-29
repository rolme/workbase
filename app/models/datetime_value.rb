class DatetimeValue < MetaValue
  def value
    datetime_value
  end

  def value=(data)  
    self.datetime_value = data
  end
end