module ApplicationHelper

  RAILS_GUIDES_URL  = "https://guides.rubyonrails.org/"
  AR_QUERYING_GUIDE = 'active_record_querying.html'


  def bootstrap_class_for(flash_type)
    {
        success: "alert-success",
        error:   "alert-danger",
        alert:   "alert-warning",
        notice:  "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end


  # this is so wrong. 2 links. yuck.
  def extern_link(text, url)

    link_to(text, url, target: '_blank', rel: 'no-follow') +
        link_to(content_tag(:sup, icon('fas', 'external-link-alt', class: 'external-link')),
                url, target: '_blank', rel: 'nofollow')
  end


  def ar_querying_guide_url
    rails_guide(AR_QUERYING_GUIDE)
  end


  def rails_guides_url
    RAILS_GUIDES_URL
  end


  def rails_guide(guide_url)
    RAILS_GUIDES_URL + guide_url
  end
end
