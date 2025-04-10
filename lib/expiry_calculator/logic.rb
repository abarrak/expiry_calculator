module ExpiryCalculator
  module Logic
    ##
    # A function to calculate the expiration from a given date.
    #
    # == Parameters:
    #
    # [*record*] +Date|DateTime|String|ApplicationRecord+: field of date and time to caluclate expiry for. Can be activerecord model containing a date field.
    # [*record_attr*] +symbol|string+ The date attribute field in case of active record model is passed in first arguemtn. Default to nil.
    #
    # == Returns:
    #
    # The remaining days till the expiry, or zero if it already past.
    #
    # == Note:
    # ref# for AR special check case:
    # https://github.com/rails/rails/blob/04cda1848cb847c2bdad0bfc12160dc8d5547775/activerecord/lib/active_record/core.rb#L135
    #
    def calculate record, record_attr = nil
      expiry_date = case record
      when DateTime
        record
      when Date
        record
      when String
        DateTime.parse(record)
      when ->(r) { defined?(ActiveRecord::Base) && r.is_a?(ActiveRecord::Base) }
        record[record_attr.to_sym]
      else
        raise ArgumentError, "record type not supported."
      end
      days = (Date.today..expiry_date).count
      days.zero? ? 0 : days - 1
    end
  end
end
