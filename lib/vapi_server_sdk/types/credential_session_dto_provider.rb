# frozen_string_literal: true

module Vapi
# The type of credential to generate a session for. Only Nango user-facing
#  providers are supported.
  class CredentialSessionDtoProvider

    GOOGLE_CALENDAR_OAUTH_2_CLIENT = "google.calendar.oauth2-client"
    GOOGLE_CALENDAR_OAUTH_2_AUTHORIZATION = "google.calendar.oauth2-authorization"
    GOOGLE_SHEETS_OAUTH_2_AUTHORIZATION = "google.sheets.oauth2-authorization"
    SLACK_OAUTH_2_AUTHORIZATION = "slack.oauth2-authorization"

  end
end