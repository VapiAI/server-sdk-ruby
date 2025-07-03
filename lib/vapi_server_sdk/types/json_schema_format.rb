# frozen_string_literal: true

module Vapi
# This is the format of the string. To pass a regex, use the `pattern` property
#  instead.
#  OpenAI documentation:
#  cs/guides/structured-outputs?api-mode=chat&type-restrictions=string-restrictions
  class JsonSchemaFormat

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