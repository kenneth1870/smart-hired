# == Schema Information
#
# Table name: rates
#
#  created_at    :datetime         not null
#  dimension     :string
#  id            :integer          not null, primary key
#  rateable_id   :integer
#  rateable_type :string
#  rater_id      :integer
#  stars         :float            not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_rates_on_rateable_type_and_rateable_id  (rateable_type,rateable_id)
#  index_rates_on_rater_id                       (rater_id)
#

class Rate < ActiveRecord::Base
  belongs_to :rater, :class_name => "User"
  belongs_to :rateable, :polymorphic => true

  #attr_accessible :rate, :dimension

end
