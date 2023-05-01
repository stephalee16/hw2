# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# DONE

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

#Studio
wb= Studio.new
wb["name"]="Warner Bros."
wb.save

#Movie
begins= Movie.new
begins["title"]="Batman Begins"
begins["year_released"]= 2005
begins["rated"]="PG-13"
begins["studio_id"]=wb["id"]
begins.save

dark1=Movie.new
dark1["title"]="The Dark Knight"
dark1["year_released"]= 2008
dark1["rated"]="PG-13"
dark1["studio_id"]=wb["id"]
dark1.save

dark2=Movie.new
dark2["title"]="The Dark Knight Rises"
dark2["year_released"]= 2012
dark2["rated"]="PG-13"
dark2["studio_id"]=wb["id"]
dark2.save

#Batman Begins
bale=Actor.new
bale["name"]="Christian Bale"
bale.save

caine=Actor.new
caine["name"]="Michael Caine"
caine.save

neeson=Actor.new
neeson["name"]="Lian Neeson"
neeson.save

holmes=Actor.new
holmes["name"]="Katie Holmes"
holmes.save

oldman=Actor.new
oldman["name"]="Gary Oldman"
oldman.save

bruce=Role.new
bruce["movie_id"]=begins["id"]
bruce["actor_id"]=bale["id"]
bruce["character_name"]="Bruce Wayne"
bruce.save

alfred=Role.new
alfred["movie_id"]=begins["id"]
alfred["actor_id"]=caine["id"]
alfred["character_name"]="Alfred"
alfred.save

al_ghul=Role.new
al_ghul["movie_id"]=begins["id"]
al_ghul["actor_id"]=neeson["id"]
al_ghul["character_name"]="Ra's Al Ghul"
al_ghul.save

rachel=Role.new
rachel["movie_id"]=begins["id"]
rachel["actor_id"]=holmes["id"]
rachel["character_name"]="Rachel Dawes"
rachel.save

gordon=Role.new
gordon["movie_id"]=begins["id"]
gordon["actor_id"]=oldman["id"]
gordon["character_name"]="Commissioner Gordon"
gordon.save

#Dark Knight
ledger=Actor.new
ledger["name"]="Heath Ledger"
ledger.save

eckhart=Actor.new
eckhart["name"]="Aaron Eckhart"
eckhart.save

gyllenhaal =Actor.new
gyllenhaal["name"]="Maggie Gyllenhaal"
gyllenhaal.save

bruce_dk1=Role.new
bruce_dk1["movie_id"]=dark1["id"]
bruce_dk1["actor_id"]=bale["id"]
bruce_dk1["character_name"]="Bruce Wayne"
bruce_dk1.save

joker=Role.new
joker["movie_id"]=dark1["id"]
joker["actor_id"]=ledger["id"]
joker["character_name"]="Joker"
joker.save

harvey=Role.new
harvey["movie_id"]=dark1["id"]
harvey["actor_id"]=eckhart["id"]
harvey["character_name"]="Harvey Dent"
harvey.save

alfred_dk1=Role.new
alfred_dk1["movie_id"]=dark1["id"]
alfred_dk1["actor_id"]=caine["id"]
alfred_dk1["character_name"]="Alfred"
alfred_dk1.save

rachel_dk1=Role.new
rachel_dk1["movie_id"]=dark1["id"]
rachel_dk1["actor_id"]=gyllenhaal["id"]
rachel_dk1["character_name"]="Rachel Dawes"
rachel_dk1.save

#Dark Knight Rises

hardy=Actor.new
hardy["name"]="Tom Hardy"
hardy.save

gordonlevitt=Actor.new
gordonlevitt["name"]="Joseph Gordon-Levitt"
gordonlevitt.save

hathaway=Actor.new
hathaway["name"]="Anne Hathaway"
hathaway.save

bruce_dk2=Role.new
bruce_dk2["movie_id"]=dark2["id"]
bruce_dk2["actor_id"]=bale["id"]
bruce_dk2["character_name"]="Bruce Wayne"
bruce_dk2.save

gordon_dk2=Role.new
gordon_dk2["movie_id"]=dark2["id"]
gordon_dk2["actor_id"]=oldman["id"]
gordon_dk2["character_name"]="Commissioner Gordon"
gordon_dk2.save

bane=Role.new
bane["movie_id"]=dark2["id"]
bane["actor_id"]=hardy["id"]
bane["character_name"]="Bane"
bane.save

john=Role.new
john["movie_id"]=dark2["id"]
john["actor_id"]=gordonlevitt["id"]
john["character_name"]="John Blake"
john.save

selina=Role.new
selina["movie_id"]=dark2["id"]
selina["actor_id"]=hathaway["id"]
selina["character_name"]="Selina Kyle"
selina.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.


# loop through movies
for i in Movie.all
    
    title = i["title"]
    year = i["year_released"]
    rated = i["rated"]
    studio = Studio.find(i["studio_id"])
    studio_name = studio["name"]

    puts "#{title}  #{year}  #{rated} #{studio_name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

for j in Role.all

  movie=Movie.find(j["movie_id"])
  movie_name=movie["name"]
  actor=Actor.find(j["actor_id"])
  actor_name=actor["name"]
  title=j["character_name"]

  puts "#{movie_name}  #{actor_name}  #{title}"

end

