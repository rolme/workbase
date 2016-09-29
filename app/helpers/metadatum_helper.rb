module MetadatumHelper

  # get appropriate field
  def meta_field(options = {})
    case options[:type]
    when 'textfield'
      text_field_tag(options[:name], options[:value], placeholder: options[:placeholder], class: options[:css])
    when 'textarea'
      text_area_tag(options[:name], options[:value], placeholder: options[:placeholder], class: options[:css])
    when 'dropdown'
      select_tag(options[:name], options_for_select(options[:default_value], options[:value]), { include_blank: true, class: options[:css] })
    when 'date'
      date_field_tag(options[:name], date_formate(options[:value]), class: options[:css])
    when 'datetime'
      datetime_field_tag(options[:name], datetime_formate(options[:value]), class: options[:css])
    when 'checkbox'
      check_box_tag(options[:name], true, options[:value], class: options[:css])
    when 'number'
      number_field_tag(options[:name], options[:value], min: options[:min], max: options[:max], class: options[:css])
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

  def hide_placeholder(field_type)
    'hidden' unless ['textfield', 'textarea'].include? field_type
  end

  def hide_number_range(field_type)
    'hidden' unless field_type == 'number'
  end

  def hide_select_option(field_type)
    'hidden' unless field_type == 'dropdown'
  end

end
