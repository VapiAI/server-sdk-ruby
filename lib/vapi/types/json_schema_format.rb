# frozen_string_literal: true

module Vapi
  module Types
    module JsonSchemaFormat
      extend Vapi::Internal::Types::Enum

      DATE_TIME = "date-time"
      TIME = "time"
      DATE = "date"
      DURATION = "duration"
      EMAIL = "email"
      HOSTNAME = "hostname"
      IPV_4 = "ipv4"
      IPV_6 = "ipv6"
      UUID = "uuid"
    end
  end
end
