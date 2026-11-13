# frozen_string_literal: true

module Vapi
  module Types
    class CallHealthDashboardSeriesPageDto < Internal::Types::Model
      field :window, -> { Vapi::Types::CallHealthDashboardWindowDto }, optional: false, nullable: false
      field :page_window, -> { Vapi::Types::CallHealthDashboardWindowDto }, optional: false, nullable: false, api_name: "pageWindow"
      field :next_cursor, -> { String }, optional: true, nullable: false, api_name: "nextCursor"
    end
  end
end
