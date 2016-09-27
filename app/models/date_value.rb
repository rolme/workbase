class DateValue < MetaValue
  def value
    date_value
  end

  def value=(data)
    self.date_value = data
  end
end