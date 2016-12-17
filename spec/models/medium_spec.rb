require 'rails_helper'

describe Medium do

  it { is_expected.to have_many(:art_objects) }
end