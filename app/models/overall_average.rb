# == Schema Information
#
# Table name: overall_averages
#
#  created_at    :datetime         not null
#  id            :integer          not null, primary key
#  overall_avg   :float            not null
#  rateable_id   :integer
#  rateable_type :string
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_overall_averages_on_rateable_type_and_rateable_id  (rateable_type,rateable_id)
#

class OverallAverage < ApplicationRecord
  belongs_to :rateable, polymorphic: true
end
