require 'rails_helper'

describe Like do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:collection) }

end
