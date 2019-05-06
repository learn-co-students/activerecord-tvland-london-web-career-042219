class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    # that returns the first and last name of an actor.
    "#{self.first_name} #{self.last_name}"
  end

  def list_roles
    # that lists all of the characters that actor has.
    character = self.characters.collect do |t|
      t.name
    end
    show = self.shows.collect do |t|
      t.name
    end
    "#{character.join} - #{show.join}"
  end
end
