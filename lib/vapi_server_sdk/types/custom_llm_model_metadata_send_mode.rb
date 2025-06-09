# frozen_string_literal: true

module Vapi
# This determines whether metadata is sent in requests to the custom provider.
#  - `off` will not send any metadata. payload will look like `{ messages }`
#  - `variable` will send `assistant.metadata` as a variable on the payload.
#  payload will look like `{ messages, metadata }`
#  - `destructured` will send `assistant.metadata` fields directly on the payload.
#  payload will look like `{ messages, ...metadata }`
#  Further, `variable` and `destructured` will send `call`, `phoneNumber`, and
#  `customer` objects in the payload.
#  Default is `variable`.
  class CustomLlmModelMetadataSendMode

    OFF = "off"
    VARIABLE = "variable"
    DESTRUCTURED = "destructured"

  end
end