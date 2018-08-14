require("pg")


class Bounty
  attr_reader(:name, :species, :bounty_value, :danger_level)

  def initialize(options)
    @id = options["id"].to_i() if options ["id"]
    @name = options["name"]
    @species = options["species"]
    @bounty_value = options["bounty_value"]
    @danger_level = options["danger_level"]
  end

end
