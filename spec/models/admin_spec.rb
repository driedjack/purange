# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin, type: :model do
  it { should have_secure_password }
  %i(name password).each { |attr| it { should validate_presence_of attr } }
  it { should validate_length_of(:name).is_at_least(3).is_at_most(25) }
  it { should allow_value('dried_jack27').for :name }
  it { should_not allow_value('123@#').for :name }
end
