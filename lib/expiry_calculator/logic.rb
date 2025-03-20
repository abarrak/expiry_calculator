module ExpiryCalculator
  module Logic
    ##
    # A function to calculate the expiration from a given date.
    #
    # == Parameters:
    #
    # [*record*] +Date|DateTime|ApplicationRecord+: field of date and time to caluclate expiry for. Can be activerecord model containing a date field.
    # [*record_attr*] +symbol|string+ The date attribute field in case of active record model is passed in first arguemtn. Default to nil.
    #
    # == Returns:
    #
    # The remaining days till the expiry, or zero if it already past.
    #
    #
    def calculate record, record_attr = nil
      expiry_date = case record
      when Date
        record
      when DateTime
        record
      when ApplicationRecord
        record[record_attr.to_sym]
      else
        raise ArgumentError, "record type not supported"
      end
      days = (Date.today..expiry_date).count
      days.zero? ? 0 : days - 1
    end
  end
end
