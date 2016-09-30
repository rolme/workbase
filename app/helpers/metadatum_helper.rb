module MetadatumHelper

  # get appropriate field
  def meta_field(options = {})
    case options[:type]
    when 'textfield'
      text_field_tag(options[:name], options[:value], class: options[:css])
    when 'textarea'
      text_area_tag(options[:name], options[:value], class: options[:css])
    when 'dropdown'
      select_tag(options[:name], options_for_select(options[:default_value], options[:value]), { include_blank: true, class: options[:css] })
    when 'date'
      date_field_tag(options[:name], date_formate(options[:value]), class: options[:css])
    when 'datetime'
      datetime_field_tag(options[:name], datetime_formate(options[:value]), class: options[:css])
    when 'checkbox'
      check_box_tag(options[:name], true, options[:value], class: options[:css])
    when 'number'
      number_field_tag(options[:name], options[:value], class: options[:css])
    end
  end

  # format date 
  def date_formate(date)
    date&.strftime('%Y-%m-%d')
  end

  # format datetime
  def datetime_formate(datetime)
    datetime&.strftime('%Y-%m-%dT%H:%M:%S')
  end
end
