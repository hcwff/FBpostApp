OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '628278780515686', 'c49b8704e5363bbecb7c18b7e89c0292', scope: "email,publish_stream"
end