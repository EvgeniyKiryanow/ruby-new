module ApplicationHelper
  def urls_to_images(html)
    html.gsub! ( %r{https://[^\s<]+} ) do |url|
      "<img src='#{url}' width='100'; />"
    end
    html.html_safe
 end
end
