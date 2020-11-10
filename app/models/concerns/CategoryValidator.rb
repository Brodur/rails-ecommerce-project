class CategoryValidator < ActiveModel::EachValidator
  def validate(record)
    if record.parent.path.include?(record)
      record.errors.add(:parent, "Relationship cannot be recursive")
    end
  end
end
