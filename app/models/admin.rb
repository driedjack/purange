# frozen_string_literal: true

class Admin < ApplicationRecord
  has_secure_password

  validates :name, presence: true,
                   length: { in: 3..25 },
                   format: { with: /\A[a-z0-9][a-z0-9_\-]*\z/i }
end
