# == Schema Information
#
# Table name: skills
#
#  created_at :datetime         not null
#  id         :bigint(8)        not null, primary key
#  name       :string
#  profile_id :integer
#  rating     :string
#  updated_at :datetime         not null
#

class Skill < ApplicationRecord
  ratyrate_rateable "rating"
  belongs_to :profile
end
