crumb :root do
  link "Home", root_path
end

crumb :products do
  link "All Products", products_path
end

crumb :product do |product|
  link product.name, products_path(product)
  parent product.category
end

crumb :categories do
  link "All Categories", categories_path
end

crumb :category do |category|
  link category.name, categories_path(category)
  if category.parent.present?
    parent category.parent
  else
    parent :categories
  end
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
