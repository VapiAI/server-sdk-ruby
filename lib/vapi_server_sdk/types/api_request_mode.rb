# frozen_string_literal: true

module Vapi
  # This is the mode of the Api Request.
  #  We only support BLOCKING and BACKGROUND for now.
  class ApiRequestMode
    BLOCKING = "blocking"
    BACKGROUND = "background"
  end
end
