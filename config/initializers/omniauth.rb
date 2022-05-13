Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1085748057063-39qc0kmdjm98i89p4am4vc4kgvvkop5b.apps.googleusercontent.com', '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',
  {
    scope: "email",
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    provider_ignores_state: true,
    image_size: 50
  }
end
OmniAuth.config.allowed_request_methods = %i[get]