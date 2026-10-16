# frozen_string_literal: true

module Vapi
  module Types
    # An environment variable supplied to code-tool execution, with support for Liquid templates in its value.
    class CodeToolEnvironmentVariable < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
