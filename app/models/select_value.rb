class SelectValue < MetaValue
  def value
    array_value
  end

  def value=(data)
     if data.nil?
      self.array_value = nil
    else
      self.array_value = data.is_a?(Array) ? data : [data]
    end
  end
end