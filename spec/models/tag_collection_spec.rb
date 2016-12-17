require 'rails_helper'

describe TagCollection do
  it { is_expected.to belong_to(:tag) }
  it { is_expected.to belong_to(:collection) }
end
