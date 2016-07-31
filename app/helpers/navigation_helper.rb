module NavigationHelper

  def nav_link(text, path, options = {})
    classes = nav_link_class_name(path, options)
    classes = "#{classes} #{options[:class]}".squish

    content_tag "li", class: classes do
      link_to nav_link_content(text, options), path
    end
  end

  private

  def nav_link_class_name(path, options)
    "active" if is_nav_link_active?(path, options)
  end

  def is_nav_link_active?(path, options)
    options.fetch(:is_active) do
      current_page?(path)
    end
  end

  def nav_link_content(text, options)
    return text if options[:icon].blank?

    fa_icon(options[:icon], text: text)
  end
end
