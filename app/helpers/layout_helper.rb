module LayoutHelper

  def page_title_tag
    !@content_for_title.blank? ? @content_for_title : "Galeria Sztuki Jackowscy"
  end

  def page_title(title)
    main = " - Galeria Sztuki Jackowscy"
    @content_for_title = title.to_s + main
  end
  
end