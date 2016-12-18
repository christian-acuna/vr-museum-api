require 'rails_helper'

describe Collection do

  it { is_expected.to have_many(:art_objects).through(:collection_art_objects) }
  it { is_expected.to have_many(:collection_art_objects) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:primary_object).class_name('ArtObject') }
  it { is_expected.to validate_presence_of(:primary_object_id) }
  it { is_expected.to validate_presence_of(:title) }

end
