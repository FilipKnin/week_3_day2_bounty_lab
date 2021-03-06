require("pg")


class Bounty
  attr_accessor(:name, :species, :bounty_value, :danger_level)
  attr_reader(:id)
  def initialize(options)
    @id = options["id"].to_i() if options ["id"]
    @name = options["name"] if options ["id"]
    @species = options["species"]
    @bounty_value = options["bounty_value"]
    @danger_level = options["danger_level"]
  end

  def save()
    db = PG.connect({dbname: "space_cowboy", host: "localhost"})
    sql = "INSERT INTO bounties
    (name, species, bounty_value, danger_level)
    VALUES
    ($1, $2, $3, $4) RETURNING *"
    values = [@name, @species, @bounty_value, @danger_level]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i()
    db.close()
  end

  def delete()
    db = PG.connect({dbname: "space_cowboy", host: "localhost"})
    sql = "DELETE FROM bounties
    WHERE id = $1"
    values = [@id]
    db.prepare("delete_one", sql)
    db.exec_prepared("delete_one", values)
    db.close()
  end

  def update
    db = PG.connect({dbname: "space_cowboy", host: "localhost"})
    sql = "UPDATE bounties
    SET
    (name, species, bounty_value, danger_level)
    =
    ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@name, @species, @bounty_value, @danger_level, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def Bounty.all()
    db = PG.connect({dbname: "space_cowboy", host: "localhost"})
    sql = "SELECT * FROM bounties"
    db.prepare("all", sql)
    bounties_list = db.exec_prepared("all")
    db.close()
    return bounties_list.map {|bounty| Bounty.new(bounty)}
  end

  def Bounty.delete_all()
    db = PG.connect({dbname: "space_cowboy", host: "localhost"})
    sql = "DELETE FROM bounties"
    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
  end

  def Bounty.find_by_name(name)
    db = PG.connect({dbname: "space_cowboy", host: "localhost"})
    sql = "SELECT * FROM bounties WHERE name = $1"
    values = [name]
    db.prepare("find_by_name", sql)
    bounties = db.exec_prepared("find_by_name", values)
    db.close()
    return bounties.map {|bounty| Bounty.new(bounty)} if name = [@name]
  else return nil
  end




end
