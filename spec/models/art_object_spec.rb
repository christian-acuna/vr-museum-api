require 'rails_helper'

describe ArtObject do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:image_url) }
  it { is_expected.to validate_presence_of(:thumbnail_url) }
  it { is_expected.to belong_to(:museum) }
  it { is_expected.to belong_to(:medium) }

end
