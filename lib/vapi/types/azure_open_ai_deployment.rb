# frozen_string_literal: true

module Vapi
  module Types
    class AzureOpenAiDeployment < Internal::Types::Model
      field :model, -> { Vapi::Types::AzureOpenAiDeploymentModel }, optional: false, nullable: false
      field :name, -> { String }, optional: false, nullable: false
    end
  end
end
