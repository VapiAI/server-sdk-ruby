# frozen_string_literal: true

module Vapi
  module Eval
    module Types
      class CreateEvalRunDto < Internal::Types::Model
        field :eval, -> { Vapi::Types::CreateEvalDto }, optional: true, nullable: false
        field :target, -> { Vapi::Eval::Types::CreateEvalRunDtoTarget }, optional: false, nullable: false
        field :type, -> { Vapi::Eval::Types::CreateEvalRunDtoType }, optional: false, nullable: false
        field :eval_id, -> { String }, optional: true, nullable: false, api_name: "evalId"
      end
    end
  end
end
