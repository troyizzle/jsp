module Components::AccordionHelper
  def accordion_title(&)
    content_for :title, capture(&), flush: true
  end

  def accordion_description(&)
    content_for :description, capture(&), flush: true
  end

  def render_accordion(title: nil, class_name: nil, description: nil, &block)
    if title && !description
      content_for :description, capture(&block), flush: true
    elsif !title && !description
      capture(&block)
    end
    render "components/ui/accordion",
      title: title,
      description: description,
      class_name: class_name
  end
end
