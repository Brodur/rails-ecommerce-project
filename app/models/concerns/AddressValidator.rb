class AddressValidator < ActiveModel::EachValidator
  def validate(record)
    return unless record.is_primary_address  # Only validate if record is a primary address.

    customer = record.customer
    customer.addresses.each do |address|
      if address.is_primary_address
        record.errors.add(:is_primary_address, "There can only be 1 primary address")
      end
    end
  end
end
