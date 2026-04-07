# frozen_string_literal: true

module Vapi
  module Types
    module FileStatus
      extend Vapi::Internal::Types::Enum

      PROCESSING = "processing"
      DONE = "done"
      FAILED = "failed"
    end
  end
end
