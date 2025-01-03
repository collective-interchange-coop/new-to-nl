# frozen_string_literal: true

class Resource < ApplicationRecord # rubocop:todo Style/Documentation
  include ::BetterTogether::Categorizable
  include ::BetterTogether::Identifier
  include ::BetterTogether::Privacy
  include ::BetterTogether::Translatable
  include Journeyable
  include NewToNlJourneyStage
  include NewToNlTopic

  has_many_journey_stages
  has_many_topics

  translates :name, type: :string
  translates :description, type: :text

  slugged :name

  # Common validations
  validates :name, presence: true
  validates :type, presence: true
  validates :locale, presence: true

  def self.load_all_subclasses
    [Document, Link].each(&:connection) # Add all known subclasses here
  end

  def to_s
    "[#{self.class.model_name.human}] - #{name}"
  end
end
