# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mortgage, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:original_balance) }

  it { is_expected.to validate_presence_of(:apr) }

  it { is_expected.to validate_presence_of(:term) }

  it { is_expected.to validate_presence_of(:payment) }
end
