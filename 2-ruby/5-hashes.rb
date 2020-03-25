favorite_colors = {
    eyes: "blue",
    "hair" => "blonde"
}
puts favorite_colors[:eyes]
favorite_colors[:legs] = "long"
puts favorite_colors
favorite_colors.delete(:legs)
puts favorite_colors
favorite_beers = {
    malt: "efes",
    classic: "mariachi",
    hair: "khina"
}
puts favorite_beers
# ON MERGE RIGHT SIDE OVERRIDES
puts favorite_colors.merge(favorite_beers)
#KEYS AND VALUES
print favorite_colors.keys
print favorite_beers.values

# a HASH WITH ONLY BOOLEANS IS A "SET"