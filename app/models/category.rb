class Category < ApplicationRecord
  has_many :children, class_name: "Category", foreign_key: "parent_id"
  has_many :products
  belongs_to :parent, class_name: "Category", optional: true

  validates :name, presence: true
  validates_with CategoryValidator, attributes: [:parent]

  paginates_per 10

  # Gets the object's parents as an array of objects
  def path
    path = []
    parent = self.parent
    until parent.nil?
      path << parent
      parent = parent.parent
    end
    path.reverse
  end

  # Gets the path of a given object
  def self.path(category)
    path = false
    if category.is_a?(Category)
      path = category.path if category.valid?
    else
      path = Category.find(category).path
    end
    path
  end

  # Returns categories that have no parent but have children, or have products
  def self.roots
    where("parent_id IS NULL").select { |category| category.children.present? || category.products.present? }
  end
end
