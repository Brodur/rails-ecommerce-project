module CategoriesHelper
  def path_to_string(category)
    path = category.path.map { |c| link_to c.name, c }.join("/")
    path += "/" + (link_to category.name, category)
    path.html_safe
  end
end
