# frozen_string_literal: true

module PayMaya
  module API
    # Class for parsing JSON value with strict return of hash value
    class JSONHash
      class Error < StandardError; end
      def self.parse(json)
        value = JSON.parse(json)
        return value if value.is_a?(Hash)

        raise Error, 'External API returned unacceptable '\
                     "#{value.class.name}"
      rescue JSON::ParserError => e
        raise Error, e.message
      end
    end
  end
end
