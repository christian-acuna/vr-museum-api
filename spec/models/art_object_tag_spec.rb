require 'rails_helper'

describe ArtObjectTag do
  it { is_expected.to belong_to(:tag) }
  it { is_expected.to belong_to(:art_object) }

end
