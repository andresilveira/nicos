module Validators
  module Url
    def self.valid?(uri)
      !uri.to_s.empty? && !!URI.parse(uri)
      rescue URI::InvalidURIError
      false
    end
  end
end
