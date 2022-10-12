module ApplicationHelper
  def showActive(title, selected)
    'icon-active' if title == selected
  end
end
