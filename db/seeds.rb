# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

User.create([
  {
    email: 'tom.farrand@goodfornothing.com',
    name: 'Tom Farrand',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true
  },
  {
    email: 'tom.rowley@goodfornothing.com',
    name: 'Tom Rowley',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true
  },
  {
    email: 'dan@goodfornothing.com',
    name: 'Dan Burgess',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true
  },
  {
    email: 'anouk@goodfornothing.com',
    name: 'Anouk Van Den Eijnde',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true
  },
  {
    email: 'andrew@goodfornothing.com',
    name: 'Andrew Sprinz',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true
  }
])

Conversation::Category.create([
  {
    title: 'Innovation in Giving'
  }
])

Skill.create([
  {
    title: 'All rounder'
  },
  {
    title: 'Designer'
  },
  {
    title: 'Developer'
  }
])

Chapter.create([
  {
    title: 'London',
    city: 'London',
    country: 'United Kingdom'
  },
  {
    title: 'Bristol',
    city: 'Bristol',
    country: 'United Kingdom'
  },
  {
    title: 'Brighton',
    city: 'Brighton',
    country: 'United Kingdom'
  },
  {
    title: 'Manchester',
    city: 'Manchester',
    country: 'United Kingdom'
  }
])

Friend.create([
  {
    name: 'Adnams',
    url: 'http://adnams.co.uk/'
  },
  {
    name: 'Al Volo',
    url: 'http://www.alvolo.co.uk/'
  },
  {
    name: 'Divine',
    url: 'http://www.divinechocolate.com/'
  },
  {
    name: 'Fallon London',
    url: 'http://www.fallon.co.uk/'
  },
  {
    name: 'Firefly Tonics',
    url: 'http://www.fireflytonics.com/'
  },
  {
    name: 'Fluxx Studios',
    url: 'http://fluxx.uk.com/'
  },
  {
    name: 'Harriman Steel',
    url: 'http://www.harrimansteel.co.uk/'
  },
  {
    name: 'Innocent',
    url: 'http://www.innocentdrinks.co.uk/'
  },
  {
    name: 'Made by Many',
    url: 'http://madebymany.com/'
  },
  {
    name: 'Pod Food',
    url: 'http://www.podfood.co.uk/'
  },
  {
    name: 'Rewired State',
    url: 'http://rewiredstate.org/'
  },
  {
    name: 'Sancho Panza',
    url: 'http://www.sanchopanza.org/'
  },
  {
    name: 'Splendid',
    url: 'http://www.splendidcomms.com/'
  },
  {
    name: 'Scriberia',
    url: 'http://scriberia.co.uk//'
  },
  {
    name: 'Tyrrells',
    url: 'http://www.tyrrellspotatochips.co.uk/'
  },
  {
    name: 'Virgin Wines',
    url: 'http://www.virginwines.co.uk/'
  },
  {
    name: 'Yorkshire Tea',
    url: 'http://www.yorkshiretea.co.uk/'
  }
])

Partner.create([
  {
    name: 'Cancer Research UK',
    url: 'http://www.cancerresearchuk.org/'
  },
  {
    name: 'Ecclesiastical Insurance',
    url: 'http://www.ecclesiastical.com/'
  }
])

Venture.create([
  {
    name: 'The DoNation',
    url: 'http://www.thedonation.org'
  }
])

@london = Chapter.find_by_title('London')
@brighton = Chapter.find_by_title('Brighton')

Gig.create([
  {
    title: 'Good for Nothing',
    chapter_id: @london.id,
    start_time: DateTime.new(2010, 12, 3, 18),
    end_time: DateTime.new(2010, 12, 4, 18)
  },
  {
    title: 'Good for Nothing',
    chapter_id: @london.id,
    start_time: DateTime.new(2011, 5, 20, 19),
    end_time: DateTime.new(2011, 5, 22, 17)
  },
  {
    title: 'D&AD New Blood',
    chapter_id: @london.id,
    start_time: DateTime.new(2011, 7, 2, 13), 
    start_time: DateTime.new(2011, 7, 2, 18)
  },
  {
    title: 'Creative Love Riot',
    chapter_id: @london.id,
    start_time: DateTime.new(2011, 8, 12, 18),
    end_time: DateTime.new(2011, 8, 14, 18),
  },
  {
    title: 'Ecclesiastical does Good for Nothing',
    chapter_id: @london.id,
    start_time: DateTime.new(2011, 9, 1, 19),
    end_time: DateTime.new(2011, 9, 3, 17)
  },
  {
    title: 'Hackney Yoga Project',
    chapter_id: @london.id,
    start_time: DateTime.new(2011, 10, 30, 13),
    end_time: DateTime.new(2011, 10, 30, 18)
  },
  { 
    title: 'University of Reading does Good for Nothing',
    chapter_id: @london.id,
    start_time: DateTime.new(2012, 1, 17, 10),
    end_time: DateTime.new(2012, 2, 10, 19)
  },
  {
    title: 'Occupy Blue Monday',
    chapter_id: @london.id,
    start_time: DateTime.new(2012, 1, 20, 18),
    end_time: DateTime.new(2012, 1, 22, 18)
  },
  {
    title: 'Make / Time',
    chapter_id: @london.id,
    start_time: DateTime.new(2012, 3, 29, 19),
    end_time: DateTime.new(2012, 3, 31, 18)
  },
  {
    title: 'Good For Nothing at SHIFT Fallon Festival',
    chapter_id: @london.id,
    start_time: DateTime.new(2012, 5, 2, 9),
    end_time: DateTime.new(2012, 5, 2, 18)
  },
  {
    title: 'Open Labs',
    chapter_id: @london.id,
    start_time: DateTime.new(2012, 5, 18, 19),
    end_time: DateTime.new(2012, 5, 20, 18)
  },
  {
    title: 'Ecclesiastical does Good for Nothing',
    chapter_id: @london.id,
    start_time: DateTime.new(2012, 6, 7, 19),
    end_time: DateTime.new(2012, 6, 9, 18)
  },
  {
    title: 'Made in Lambeth',
    chapter_id: @london.id,
    start_time: DateTime.new(2012, 6, 21, 18),
    end_time: DateTime.new(2012, 6, 23, 18)
  }, 
  {
    title: 'Summer of Love',
    chapter_id: @brighton.id,
    start_time: DateTime.new(2012, 6, 22, 18),
    end_time: DateTime.new(2012, 6, 24, 18)
  },
  {
    title: 'Wild Thing',
    chapter_id: @london.id,
    start_time: DateTime.new(2012, 7, 6, 19),
    end_time: DateTime.new(2012, 7, 8, 18)
  }
])