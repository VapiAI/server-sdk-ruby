# frozen_string_literal: true

module Vapi
  # This is the column in the call table that will be filtered on.
  #  Date Type columns are columns where the rows store data as a date.
  #  Must be a valid column for the selected table.
  class FilterDateTypeColumnOnCallTableColumn
    STARTED_AT = "startedAt"
    ENDED_AT = "endedAt"
  end
end
