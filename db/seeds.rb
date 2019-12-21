# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

# Product.create!(
#   title: '',
#   description:
#     %{
#
#     },
#   image_url: '',
#   price: ,
# )

Product.create!(
  title: 'Agile Web Development with Rails 5.1',
  description:
    %{<p>
        <em>Learn Rails the way the Rails core team recommends it</em>
        , along with the tens of thousands of developers who have used this broad, far-reaching tutorial and reference. If you’re new to Rails, you’ll get step-by-step guidance. If you’re an experienced developer, get the comprehensive, insider information you need for the latest version of Ruby on Rails. The new edition of this award-winning classic is completely updated for Rails 5.1 and Ruby 2.4, with information on system testing, Webpack, and advanced JavaScript.
      </p>
    },
  image_url: 'rails51.jpg',
  price: 0.01,
)

Product.create!(
  title: 'Programming Ruby (2nd edition)',
  description:
    %{The Pickaxe book, named for the tool on the cover, is the definitive reference to Ruby, a highly-regarded, fully object-oriented programming language. This Second Edition has more than 200 pages of new content, and substantial enhancements to the original, covering all the new and improved language features of Ruby 1.8 and standard library modules.
    },
  image_url: 'ruby.jpg',
  price: 10,
)

Product.create!(
  title: 'Ruby on Rails Tutorial: Learn Web Development with Rails (4th Edition)',
  description:
    %{Used by sites as varied as Twitter, GitHub, Disney, and Airbnb, Ruby on Rails is one of the most popular frameworks for developing web applications, but it can be challenging to learn and use. Whether you’re new to web development or new only to Rails, Ruby on Rails™ Tutorial, Fourth Edition, is the solution.
    },
  image_url: 'rails_tutorial.jpg',
  price: 100,
)
