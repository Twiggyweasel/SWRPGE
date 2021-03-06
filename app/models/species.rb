# frozen_string_literal: true

class Species < ApplicationRecord
  has_rich_text :description
  # Associations
  has_one :character_stat, as: :statable
  belongs_to :silhouette
  accepts_nested_attributes_for :character_stat
  belongs_to :source, optional: true

  # Validations
  validates :name, :description, presence: true

  delegate :brawn, :agility, :intellect, :cunning, :willpower, :presence, :wound_threshold, :strain_threshold, :experience, to: :character_stat
end
