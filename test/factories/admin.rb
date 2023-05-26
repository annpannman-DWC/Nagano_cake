FactoryBot.define do
  factory :admin do
    email { "yamada@yamada" }
    password { "abc123" }
    # reset_password_token { nil }
    # reset_password_sent_at { nil }
    # remember_created_at { nil }
    # created_at { Time.now }
    # updated_at { Time.now }
  end
end
