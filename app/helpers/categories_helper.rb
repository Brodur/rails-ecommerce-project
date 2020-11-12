module CategoriesHelper
  def path_to_string(category)
    path = category.path.map { |category| link_to category.name, category }.join("/")
    path += "/" + (link_to category.name, category)
    path.html_safe
  end
end
