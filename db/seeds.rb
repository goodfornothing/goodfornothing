# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Skill.create([
  { title: 'Think' },
  { title: 'Design' },
  { title: 'Code' }
])

Warbling.create([
  { title: 'Food' },
  { title: 'Energy' },
  { title: 'Environment' },
  { title: 'Education' },
  { title: 'Poverty' },
  { title: 'Inequality' },
  { title: 'Health' },
  { title: 'Community' }
])

@london = Chapter.create({
  title: 'London',
  city: 'London',
  country: 'United Kingdom'
})

@bristol = Chapter.create({
  title: 'Bristol',
  city: 'Bristol',
  country: 'United Kingdom'
})

@brighton = Chapter.create({
  title: 'Brighton',
  city: 'Brighton',
  country: 'United Kingdom'
})

@manchester = Chapter.create({
  title: 'Manchester',
  city: 'Manchester',
  country: 'United Kingdom'
})

User.create([
  {
    email: 'tom.farrand@goodfornothing.com',
    name: 'Tom Farrand',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true,
    chapter_id: @london.id
  },
  {
    email: 'tom.rowley@goodfornothing.com',
    name: 'Tom Rowley',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true,
    chapter_id: @london.id
  },
  {
    email: 'dan@goodfornothing.com',
    name: 'Dan Burgess',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true,
    chapter_id: @london.id
  },
  {
    email: 'anouk@goodfornothing.com',
    name: 'Anouk Van Den Eijnde',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true,
    chapter_id: @london.id
  },
  {
    email: 'andrew@goodfornothing.com',
    name: 'Andrew Sprinz',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true,
    chapter_id: @london.id,
    twitter_handle: '@andrewsprinz',
    url: 'http://www.goodfornothing.com',
    location: 'London, UK',
    gender: 'Male',
    age: '29'
  },
  {
    email: 'mark@thembigoaktrees.com',
    name: 'Mark Sears',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true,
    chapter_id: @brighton.id
  },
  {
    email: 'zoe@engagebydesign.org',
    name: 'Zoe Olivia John',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true,
    chapter_id: @brighton.id
  },
  {
    email: 'rodrigo@engagebydesign.org',
    name: 'Rodrigo Bautista',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true,
    chapter_id: @brighton.id
  },
  {
    email: 'al@goodfornothing.com',
    name: 'Al Kennedy',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true,
    chapter_id: @bristol.id
  },
  {
    email: 'hello@becausestudio.co.uk',
    name: 'Loz Ives',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true,
    chapter_id: @manchester.id
  },
  {
    email: 'andy@goodfornothing.com',
    name: 'Andy Gott',
    password: 'password',
    password_confirmation: 'password',
    approved: true,
    admin: true,
    chapter_id: @manchester.id
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
  },
  {
    name: 'Sony Europe',
    url: 'http://www.openplanetideas.com/'
  },
  {
    name: 'Lambeth Council',
    url: 'http://www.lambeth.gov.uk'
  },
  {
    name: 'University of Reading',
    url: 'http://www.reading.ac.uk/typography/'
  },
  {
    name: 'Fallon',
    url: 'http://wearefallon.tumblr.com/'
  },
  {
    name: 'D&AD New Blood',
    url: 'http://www.dandad.org/talent/new-blood/'
  }
])

Venture.create([
  {
    name: 'The DoNation',
    url: 'http://www.thedonation.org'
  },
  {
    name: 'PopUp Festival of Stories',
    url: 'http://pop-up.org.uk/'
  },
  {
    name: 'Sustaination',
    url: 'http://www.sustaination.co.uk/'
  },
  {
    name: 'Global Generation',
    url: 'http://www.globalgeneration.org.uk/'
  },
  {
    name: 'Good Gym',
    url: 'http://www.thegoodgym.org/'
  },
  {
    name: 'Great Football Giveaway',
    url: 'http://www.thegreatfootballgiveaway.org.uk/'
  },
  {
    name: 'Stay up Late',
    url: 'http://www.stayuplate.org'
  },
  {
    name: 'hiSbe',
    url: 'http://www.hisbe.co.uk/'
  },
  {
    name: 'PricePie',
    url: 'http://www.pricepie.co.uk/'
  },
  {
    name: 'Hackney Yoga Project',
    url: 'http://hackneyyogaproject.blogspot.co.uk/'
  },
  {
    name: '50/50 Make or Break',
    url: 'http://5050.gd'
  },
  {
    name: 'GnewtCargo',
    url: 'http://gnewtcargo.co.uk/'
  },
  {
    name: 'FoodCycle',
    url: 'http://www.foodcycle.org.uk/'
  },
  {
    name: 'Bletchley Park',
    url: 'http://www.savingbletchleypark.org/'
  },
  {
    name: 'Young Gloucestershire',
    url: 'http://www.youngglos.org.uk/'
  },
  {
    name: 'Cotswold Care Hospice',
    url: 'http://www.cotswoldcare.org.uk/'
  },
  {
    name: 'Gloucestershire Young Carers',
    url: 'http://www.glosyoungcarers.org.uk/'
  },
  {
    name: 'Stirchley Food Co-op',
    url: 'http://www.stirchleystores.co.uk/'
  },
  {
    name: 'Continental Star FC',
    url: 'http://www.continentalstarfc.co.uk/'
  },
  {
    name: 'Jericho Foundation',
    url: 'http://www.jcp.org.uk/'
  },
  {
    name: 'Thames 21',
    url: 'http://www.thames21.org.uk/'
  },
  {
    name: 'Espace Benevolat',
    url: 'http://www.espacebenevolat.org/'
  },
  {
    name: 'The Abundance Network',
    url: 'http://www.growsheffield.com/images/abundbkview.pdf'
  },
  {
    name: 'Special Effect',
    url: 'http://www.gamebase.info/'
  },
  {
    name: 'Open Cinema',
    url: 'http://www.opencinema.net/'
  },
  {
    name: 'Homeless SMS',
    url: 'http://homelesssms.com/'
  },
  {
    name: 'Bethnal Green Ventures',
    url: 'http://bethnalgreenventures.com/'
  }
])

@gfn_1 = Gig.create({
    title: 'Good for Nothing',
    chapter_id: @london.id,
    start_time: DateTime.new(2010, 12, 3, 18),
    end_time: DateTime.new(2010, 12, 4, 18)
})
  
@gfn_2 = Gig.create({
  title: 'Good for Nothing',
  chapter_id: @london.id,
  start_time: DateTime.new(2011, 5, 20, 19),
  end_time: DateTime.new(2011, 5, 22, 17)
})
  
@newblood = Gig.create({
  title: 'D&AD New Blood',
  chapter_id: @london.id,
  start_time: DateTime.new(2011, 7, 2, 13), 
  start_time: DateTime.new(2011, 7, 2, 18),
  partner_id: Partner.find_by_name('D&AD New Blood').id
})
  
@loveriot = Gig.create({
  title: 'Creative Love Riot',
  chapter_id: @london.id,
  start_time: DateTime.new(2011, 8, 12, 18),
  end_time: DateTime.new(2011, 8, 14, 18)
})
  
@ecclesiastical = Gig.create({
  title: 'Ecclesiastical does Good for Nothing',
  chapter_id: @london.id,
  start_time: DateTime.new(2011, 9, 1, 19),
  end_time: DateTime.new(2011, 9, 3, 17),
  partner_id: Partner.find_by_name('Ecclesiastical Insurance').id
})
  
@hackneyyoga = Gig.create({
  title: 'Hackney Yoga Project',
  chapter_id: @london.id,
  start_time: DateTime.new(2011, 10, 30, 13),
  end_time: DateTime.new(2011, 10, 30, 18)
})
  
@readinguni = Gig.create({
  title: 'University of Reading does Good for Nothing',
  chapter_id: @london.id,
  start_time: DateTime.new(2012, 1, 17, 10),
  end_time: DateTime.new(2012, 2, 10, 19),
  partner_id: Partner.find_by_name('University of Reading').id
})
  
@bluemonday = Gig.create({
  title: 'Occupy Blue Monday',
  chapter_id: @london.id,
  start_time: DateTime.new(2012, 1, 20, 18),
  end_time: DateTime.new(2012, 1, 22, 18)
})
  
@maketime = Gig.create({
  title: 'Make / Time',
  chapter_id: @london.id,
  start_time: DateTime.new(2012, 3, 29, 19),
  end_time: DateTime.new(2012, 3, 31, 18),
  partner_id: Partner.find_by_name('Sony Europe').id
})
  
@fallonshift = Gig.create({
  title: 'Good For Nothing at SHIFT Fallon Festival',
  chapter_id: @london.id,
  start_time: DateTime.new(2012, 5, 2, 9),
  end_time: DateTime.new(2012, 5, 2, 18),
  partner_id: Partner.find_by_name('Fallon').id
})
  
@openlabs = Gig.create({
  title: 'Open Labs',
  chapter_id: @london.id,
  start_time: DateTime.new(2012, 5, 18, 19),
  end_time: DateTime.new(2012, 5, 20, 18),
  partner_id: Partner.find_by_name('Cancer Research UK').id
})
  
@ecclesiastical_2 = Gig.create({
  title: 'Ecclesiastical does Good for Nothing',
  chapter_id: @london.id,
  start_time: DateTime.new(2012, 6, 7, 19),
  end_time: DateTime.new(2012, 6, 9, 18),
  partner_id: Partner.find_by_name('Ecclesiastical Insurance').id
})
  
@madeinlambeth = Gig.create({
  title: 'Made in Lambeth',
  chapter_id: @london.id,
  start_time: DateTime.new(2012, 6, 21, 18),
  end_time: DateTime.new(2012, 6, 23, 18),
  partner_id: Partner.find_by_name('Lambeth Council').id
})
  
@sol = Gig.create({
  title: 'Summer of Love',
  chapter_id: @brighton.id,
  start_time: DateTime.new(2012, 6, 22, 18),
  end_time: DateTime.new(2012, 6, 24, 18)
})

@wildthing = Gig.create({
  title: 'Wild Thing - Re-connecting Kids with Nature and Wildness',
  chapter_id: @london.id,
  start_time: DateTime.new(2012, 7, 6, 19),
  end_time: DateTime.new(2012, 7, 8, 18)
})

@shipshape = Gig.create({
  title: 'ShipShape',
  chapter_id: @bristol.id,
  start_time: DateTime.new(2012, 7, 22, 18),
  end_time: DateTime.new(2012, 7, 24, 17)
})

Challenge.create([
  {
    gig_id: @wildthing.id
  },
  {
    gig_id: @sol.id,
    venture_id: Venture.find_by_name('hiSbe').id
  },
  {
    gig_id: @sol.id,
    venture_id: Venture.find_by_name('Stay up Late').id
  },
  {
    gig_id: @sol.id,
    venture_id: Venture.find_by_name('PricePie').id
  },
  {
    gig_id: @madeinlambeth.id,
    title: 'Healthwatch'
  },
  {
    gig_id: @madeinlambeth.id,
    title: 'Digital'
  },
  {
    gig_id: @madeinlambeth.id,
    title: 'Parks'
  },
  {
    gig_id: @ecclesiastical_2.id,
    venture_id: Venture.find_by_name('Stirchley Food Co-op').id
  },
  {
    gig_id: @ecclesiastical_2.id,
    venture_id: Venture.find_by_name('Continental Star FC').id
  },
  {
    gig_id: @ecclesiastical_2.id,
    venture_id: Venture.find_by_name('Jericho Foundation').id
  },
  {
    gig_id: @openlabs.id,
    title: 'Communications'
  },
  {
    gig_id: @openlabs.id,
    title: 'Genetic Analysis'
  },
  {
    gig_id: @openlabs.id,
    title: 'Cell Analysis'
  },
  {
    gig_id: @fallonshift.id,
    venture_id: Venture.find_by_name('The Abundance Network').id
  },
  {
    gig_id: @fallonshift.id,
    venture_id: Venture.find_by_name('Special Effect').id
  },
  {
    gig_id: @fallonshift.id,
    venture_id: Venture.find_by_name('Open Cinema').id
  },
  {
    gig_id: @maketime.id,
    venture_id: Venture.find_by_name('Thames 21').id
  },
  {
    gig_id: @maketime.id,
    venture_id: Venture.find_by_name('Espace Benevolat').id
  },
  {
    gig_id: @maketime.id,
    title: "Hack the U+ Source"
  },
  {
    gig_id: @bluemonday.id,
    venture_id: Venture.find_by_name('The DoNation').id
  },
  {
    gig_id: @bluemonday.id,
    venture_id: Venture.find_by_name('PopUp Festival of Stories').id
  },
  {
    gig_id: @bluemonday.id,
    venture_id: Venture.find_by_name('Sustaination').id
  },
  {
    gig_id: @readinguni.id,
    venture_id: Venture.find_by_name('Homeless SMS').id
  },
  {
    gig_id: @readinguni.id,
    venture_id: Venture.find_by_name('Hackney Yoga Project').id
  },
  {
    gig_id: @readinguni.id,
    venture_id: Venture.find_by_name('Good Gym').id
  },
  {
    gig_id: @hackneyyoga.id,
    venture_id: Venture.find_by_name('Hackney Yoga Project').id
  },
  {
    gig_id: @ecclesiastical.id,
    venture_id: Venture.find_by_name('Young Gloucestershire').id
  },
  {
    gig_id: @ecclesiastical.id,
    venture_id: Venture.find_by_name('Cotswold Care Hospice').id
  },
  {
    gig_id: @ecclesiastical.id,
    venture_id: Venture.find_by_name('Gloucestershire Young Carers').id
  },
  {
    gig_id: @loveriot.id,
    venture_id: Venture.find_by_name('50/50 Make or Break').id
  },
  {
    gig_id: @newblood.id,
    venture_id: Venture.find_by_name('Homeless SMS').id
  },
  {
    gig_id: @newblood.id,
    venture_id: Venture.find_by_name('Good Gym').id
  },
  {
    gig_id: @newblood.id,
    venture_id: Venture.find_by_name('Bethnal Green Ventures').id
  },
  {
    gig_id: @gfn_2.id,
    venture_id: Venture.find_by_name('GnewtCargo').id
  },
  {
    gig_id: @gfn_2.id,
    venture_id: Venture.find_by_name('FoodCycle').id
  },
  {
    gig_id: @gfn_2.id,
    venture_id: Venture.find_by_name('Bletchley Park').id
  },
  {
    gig_id: @gfn_1.id,
    venture_id: Venture.find_by_name('Global Generation').id
  },
  {
    gig_id: @gfn_1.id,
    venture_id: Venture.find_by_name('Good Gym').id
  },
  {
    gig_id: @gfn_1.id,
    venture_id: Venture.find_by_name('Great Football Giveaway').id
  }
])
  