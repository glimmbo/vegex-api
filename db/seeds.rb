# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Trade.destroy_all
Offer.destroy_all

pass = "pass"

addresses = [
  "2255 York Avenue, Vancouver, BC",
  "2186 Lawson Avenue, West Vancouver, BC",
  "1101 Gordon Avenue, West Vancouver, BC",
  "1199 Lynn Valley Road, North Vancouver, BC",
  "1532 Salal Crescent, Coquitlam, BC",
  "7303 Montecito Drive, Burnaby, BC",
  "3451 Regent Street, Richmond, BC",
  "9088 Jones Road, Richmond, BC",
  "5998 131a Street, Surrey, BC",
  "2598 Kitchener Street, Vancouver, BC",
  "100 W 15th Avenue, Vancouver, BC",
  "32470 Haida Drive, Abbotsford, BC",
  "6565 Greenmount Street, Chilliwack, BC"
]

puts addresses.length

User.create(
  name: "Mark",
  email: "markglimm@gmail.com",
  password: pass,
  password_confirmation: pass,
  address: "2725 Prince Edward Street, Vancouver, BC",
  range: 5,
  about: "I was once an urban farmer, now I'm growing my skills as a web developer. Still passionate for produce and love to trade here on Vegex",
  completion: 100,
  slots: 10
)

addresses.each do
  name = Faker::Name.first_name
  email = "#{name}#{rand(1..5)}@example.com"
  User.create(
    name: name,
    email: email,
    password: pass,
    password_confirmation: pass,
    address: addresses.pop,
    range: rand(1..20),
    about: Faker::Hipster.paragraph,
    completion: rand(50..100),
    slots: 1
  )
  sleep(5)
end

users = User.all
veglist = [
  "acorn squash",
  "alfalfa sprout",
  "amaranth",
  "anise",
  "artichoke",
  "arugula",
  "asparagus",
  "aubergine",
  "azuki bean",
  "banana squash",
  "basil",
  "bean sprout",
  "beet",
  "black bean",
  "black-eyed pea",
  "bok choy",
  "borlotti bean",
  "broad beans",
  "broccoflower",
  "broccoli",
  "brussels sprout",
  "butternut squash",
  "cabbage",
  "calabrese",
  "caraway",
  "carrot",
  "cauliflower",
  "cayenne pepper",
  "celeriac",
  "celery",
  "chamomile",
  "chard",
  "chayote",
  "chickpea",
  "chives",
  "cilantro",
  "collard green",
  "corn",
  "corn salad",
  "courgette",
  "cucumber",
  "daikon",
  "delicata",
  "dill",
  "eggplant",
  "endive",
  "fennel",
  "fiddlehead",
  "frisee",
  "garlic",
  "gem squash",
  "ginger",
  "green bean",
  "green pepper",
  "habanero",
  "herbs and spice",
  "horseradish",
  "hubbard squash",
  "jalapeno",
  "jerusalem artichoke",
  "jicama",
  "kale",
  "kidney bean",
  "kohlrabi",
  "lavender",
  "leek ",
  "legume",
  "lemon grass",
  "lentils",
  "lettuce",
  "lima bean",
  "mamey",
  "mangetout",
  "marjoram",
  "mung bean",
  "mushroom",
  "mustard green",
  "navy bean",
  "new zealand spinach",
  "nopale",
  "okra",
  "onion",
  "oregano",
  "paprika",
  "parsley",
  "parsnip",
  "patty pan",
  "pea",
  "pinto bean",
  "potato",
  "pumpkin",
  "radicchio",
  "radish",
  "rhubarb",
  "rosemary",
  "runner bean",
  "rutabaga",
  "sage",
  "scallion",
  "shallot",
  "skirret",
  "snap pea",
  "soy bean",
  "spaghetti squash",
  "spinach",
  "squash ",
  "sweet potato",
  "tabasco pepper",
  "taro",
  "tat soi",
  "thyme",
  "topinambur",
  "tubers",
  "turnip",
  "wasabi",
  "water chestnut",
  "watercress",
  "white radish",
  "yam",
  "zucchini"
]
vegicons = [
  'asparagus',
  'bean',
  'beet',
  'broccoli',
  'carrot',
  'cauliflower',
  'celery',
  'corn',
  'cucumber',
  'eggplant',
  'garlic',
  'greens',
  'hot-pepper',
  'kohlrabi',
  'leek',
  'lettuce',
  'mushroom',
  'onion',
  'pea',
  'pepper',
  'potato',
  'pumpkin',
  'radish',
  'squash',
  'sweet-potato',
  'tomato'
]

users.each do |user|
  Trade.create(
    user_id: user.id,
    produce: vegicons.sample
  )
end

puts "Created #{User.count} users from #{addresses.length} addresses | #{Trade.count} trades"