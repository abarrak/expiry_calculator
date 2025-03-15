module ExpiryCalculator
  ##
  # A function to calculate the expiration from a given date.
  #
  def calculate record, record_attr = nil
    expiry_date = case record
      when Date
        record
      when DateTime
        record
      when ApplicationRecord
        record[record_attr]
      else
    end
    days = (Date.today..expiry_date).count
    days.zero? ? 0 : days - 1
  end
end
