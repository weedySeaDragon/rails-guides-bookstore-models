module ApplicationHelper

  def bootstrap_class_for(flash_type)
    {
        success: "alert-success",
        error:   "alert-danger",
        alert:   "alert-warning",
        notice:  "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end


  # this is so wrong. 2 links.  yuck.
  def extern_link(text, url)

    link_to(text, url) +
        link_to(content_tag(:sup, icon('fas', 'external-link-alt', class: 'external-link')),
                url)
  end

end
