class Category < ApplicationRecord
  has_many :children, class_name: "Category", foreign_key: "parent_id"
  has_many :products
  belongs_to :parent, class_name: "Category", optional: true

  validates :name, presence: true
  # validates_with CategoryValidator, fields: [:parent]

  # def self.path
  #   path = []
  #   parent = self.parent
  #   until parent.empty?
  #     path << parent
  #     parent = parent.parent
  #   end
  #   path.reverse
  # end
end

# class CategoryValidator < ActiveModel::Validator
#   def validate(record); end
# end
