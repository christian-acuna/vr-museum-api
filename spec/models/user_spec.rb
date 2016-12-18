require 'rails_helper'

describe User do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to have_many(:collections) }
  it { is_expected.to have_many(:likes) }
  it { is_expected.to have_many(:favorites) }
  it { is_expected.to validate_uniqueness_of(:username) }

end
