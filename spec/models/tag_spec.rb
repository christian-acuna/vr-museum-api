require 'rails_helper'

describe Tag do
  it { is_expected.to validate_presence_of(:name) }

end
