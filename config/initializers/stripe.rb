if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_frpqtHh7gO2l60f9k6b7vLGM',
    secret_key: 'sk_test_B6dZFpnBZSjApmWuH3nrwhiy'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]