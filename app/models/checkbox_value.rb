class CheckboxValue < MetaValue
  def value
    boolean_value
  end

  def value=(data)
    self.boolean_value = data
  end
end