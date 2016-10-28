class NumberValue < MetaValue
  def value
    integer_value
  end

  def value=(data)
    self.integer_value = data
  end
end