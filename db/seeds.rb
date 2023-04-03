# frozen_string_literal: true

User.create(
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: 0
)
User.create(
  email: 'librarian@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: 1
)
User.create(
  email: 'administrator@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: 2
)
