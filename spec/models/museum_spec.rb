require 'rails_helper'

describe Museum do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to have_many(:art_objects) }
end
