## 0.11.0 - 2025-11-19
* feat: add conversation type and dial timeout to Twilio SMS transport
* Enhance the Twilio SMS chat transport with new configuration options for better call handling. Add conversation type specification and dial timeout control for SIP transfers.
* Key changes:
* Add conversation_type field to TwilioSmsChatTransport with new enum type
* Add dial_timeout parameter to TransferPlan for SIP DIAL operations
* Remove X-Fern-SDK-Version header from request headers
* Add new type export for TwilioSmsChatTransportConversationType
* Update documentation and validation for new fields
* 🌿 Generated with Fern

