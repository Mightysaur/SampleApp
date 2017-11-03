module ApplicationHelper
  #Returns the full title for every page
  def full_title(page_title = '')
    base_title = "Team 19 Log"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
