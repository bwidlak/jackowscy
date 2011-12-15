module LayoutHelper

  def body_class
    [@body_class || controller.action_name].join(' ')
  end
  
  def body_tag(options={}, &block)
    options = {
                :id => controller.controller_name,
                :class => body_class
              }.merge(options)
    content_tag(:body, options, &block)
  end

  def page_title(title, show_title = true)
    @content_for_title = title.to_s
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end

end