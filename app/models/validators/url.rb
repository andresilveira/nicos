module Validators
  module Url
    def self.valid?(uri)
      uri = URI.parse(uri.to_s)
      uri.host.present? && uri.scheme.present?
    rescue URI::InvalidURIError
      false
    end
  end
end
