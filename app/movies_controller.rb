
def can_be_instantiated_and_then_saved
  movie = Movie.new #a movie can be instantiated
  movie.title = "This is a title."
  movie.save #a movie can be saved
  movie #returning the instance that was instantiated
end

def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.new(attributes)
  movie.save
  movie #return value of create should always be the object that we created
end

def can_be_created_in_a_block(args = { title: "Home Alone", release_date: 1990 })
  Movie.create do |m|
    m.title = args[:title]
    m.release_date = args[:release_date]
  end
end

def can_get_the_first_item_in_the_database
  Movie.first.title
end

def can_get_the_last_item_in_the_database
  Movie.last.title
end

def can_get_size_of_the_database
  Movie.count
end

def can_find_the_first_item_from_the_database_using_id
  Movie.find_by(id: 1).title
end

def can_find_by_multiple_attributes
  #is there another way to do this besides hard coding?
  Movie.find_by("title = 'Title' ", "release_date = '2000' ", "director = 'Me' ")
end

def can_find_using_where_clause_and_be_sorted
  # For this test return all movies released after 2002 and ordered by
  # release date descending
  Movie.where("release_date > '2002' ").order("release_date DESC")
end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick"
  Movie.create(title: "Awesome Flick") #creates movie & saves it
  movie = Movie.find_by(title: "Awesome Flick") #has to be retrieved first
  movie.update(title: "Even Awesomer Flick")
  movie.save
end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  movie = Movie.find_by(title: "Wat?")
  movie.update(title: "Wat, huh?")
end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  Movie.all.each do |movie|
    movie.update(title: "A Movie")
  end
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  Movie.where(title: "That One Where the Guy Kicks Another Guy Once").destroy_all
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.all.each do |movie|
    movie.destroy
  end
end
