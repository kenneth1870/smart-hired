# == Schema Information
#
# Table name: rating_caches
#
#  avg            :float            not null
#  cacheable_id   :integer
#  cacheable_type :string
#  created_at     :datetime         not null
#  dimension      :string
#  id             :integer          not null, primary key
#  qty            :integer          not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_rating_caches_on_cacheable_type_and_cacheable_id  (cacheable_type,cacheable_id)
#

class RatingCache < ActiveRecord::Base
  belongs_to :cacheable, :polymorphic => true
end
