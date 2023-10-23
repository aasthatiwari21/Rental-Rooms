Rails.configuration.stripe = { 
  :publishable_key => 'pk_test_51O2YupSGEzrH4LcsgU6ROciyJZeHHQlpGXOd3QxvSFcWJs8g58nfQ4YTzevVTGbwDt4ZY2x1hGhkvlY4hHd9CWdh00EOZOcNlX',
  :secret_key => 'sk_test_51O2YupSGEzrH4LcszHrWTM5KGMHQsnS1RW4n32BDvqUtbwxcXV2Dc357Xde4PqLUzhHbpPN2awYM5hO0qYla9Lrl00iPuuobIN'
} 
Stripe.api_key = Rails.configuration.stripe[:secret_key]