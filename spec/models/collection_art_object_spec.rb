require 'rails_helper'

describe CollectionArtObject do
  it { is_expected.to belong_to(:collection) }
  it { is_expected.to belong_to(:art_object) }
end
