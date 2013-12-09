# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Skill.create([
  { title: 'Think' },
  { title: 'Design' },
  { title: 'Code' }
])

Issue.create([
  { title: 'Food' },
  { title: 'Energy' },
  { title: 'Environment' },
  { title: 'Education' },
  { title: 'Poverty' },
  { title: 'Human Rights' },
  { title: 'Health' },
  { title: 'Community' },
  { title: 'Water' }
])

@london = Chapter.create({
  title: 'London',
  country: 'United Kingdom'
})

@bristol = Chapter.create({
  title: 'Bristol',
  country: 'United Kingdom'
})

@brighton = Chapter.create({
  title: 'Brighton',
  country: 'United Kingdom'
})

@manchester = Chapter.create({
  title: 'Manchester',
  country: 'United Kingdom'
})

@wellington = Chapter.create({
  title: 'Wellington',
  country: 'New Zealand'
})

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
    name: 'Co-operative Food',
    url: 'http://www.co-operative.coop/food/welcome/'
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
  },
  {
    name: 'Redroaster',
    url: 'http://www.redroaster.co.uk/'
  },
  {
    name: 'Lick Yoghurt',
    url: 'http://lickyogurt.com/'
  },
  {
    name: 'Lighthouse',
    url: 'http://www.lighthouse.org.uk/'
  },
  {
    name: 'Higgidy',
    url: 'http://www.higgidy.co.uk/'
  },
  {
    name: 'Hotel Chocolat',
    url: 'http://www.hotelchocolat.co.uk/'
  },
  {
    name: 'Bagelman',
    url: 'http://www.bagelman.co.uk/'
  },
  {
    name: 'Aspall',
    url: 'http://www.aspall.co.uk/'
  },
  {
    name: 'Pieminister',
    url: 'http://pieminister.co.uk/'
  },
  {
    name: 'Kabuto Noodles',
    url: 'http://www.kabutonoodles.com/'
  },
  {
    name: "Jimmy's Iced Coffee",
    url: 'http://jimmysicedcoffee.com/'
  },
  {
    name: 'Bear Nibbles',
    url: 'http://www.bearnibbles.co.uk/'
  },
  {
    name: 'Mozilla',
    url: 'http://www.mozilla.org/'
  }
])

Partner.create([
  {
    name: 'Cancer Research UK',
    url: 'http://www.cancerresearchuk.org/',
    active: true
  },
  {
    name: 'Ecclesiastical Insurance',
    url: 'http://www.ecclesiastical.com/',
    active: true
  },
  {
    name: 'Open Planet Ideas',
    url: 'http://www.openplanetideas.com/',
    active: true
  },
  {
    name: 'Lambeth Council',
    url: 'http://www.lambeth.gov.uk',
    active: true
  },
  {
    name: 'University of Reading',
    url: 'http://www.reading.ac.uk/typography/',
    active: true
  },
  {
    name: 'Fallon',
    url: 'http://wearefallon.tumblr.com/',
    active: true
  },
  {
    name: 'D&AD New Blood',
    url: 'http://www.dandad.org/talent/new-blood/',
    active: true
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
  },
  {
    name: 'Signposts',
    url:'http://www.signposts.org.uk/'
  },
  {
    name: 'Carbon Coop',
    url: 'http://carbon.coop/'
  },
  {
    name: 'Mountains of Hope',
    url: 'http://mountainsofhope.co.uk/'
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
  partner_id: Partner.find_by_name('Open Planet Ideas').id
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

@madeinlambeth_2 = Gig.create({
  title: 'Made in Lambeth 2',
  chapter_id: @london.id,
  start_time: DateTime.new(2012, 10, 12, 18),
  end_time: DateTime.new(2012, 10, 14, 17)
})

@northernsoul = Gig.create({
  title: 'Northern Soul',
  chapter_id: @manchester.id,
  start_time: DateTime.new(2012, 10, 5, 18),
  end_time: DateTime.new(2012, 10, 7, 17),
  location: 'MadLab, 36-40 Edge Street, Manchester M4 1HN',
  description: "The first Good for Nothing gig is kicking off in Manchester!
  It's the third chapter of the next wave of Good for Nothing across the UK - Brighton and Bristol went off already and we're really excited to get things going in Manchester.
  Bringing together doers, makers and tinkerers to accelerate the work of 3 of leading local social innovators on 3 tangible briefs. 
  There'll be music, food, drink and lots of getting stuff made... doing not just talking, collaborating and experimenting and supporting grassroots social and environmental innovators"
})

@gfn_3 = Gig.create({
    title: 'Good for Nothing',
    chapter_id: @london.id,
    start_time: DateTime.new(2013, 1, 26, 18),
    end_time: DateTime.new(2013, 1, 27, 18)
})

Social.create([
  {
    chapter_id: @bristol.id,
    start_time: DateTime.new(2012, 9, 27, 7),
    location: 'The Canteen'
  },
  {
    chapter_id: @london.id,
    start_time: DateTime.new(2012, 9, 19, 6.5),
    location: 'Betsey Trotwood'
  },
  {
    chapter_id: @london.id,
    start_time: DateTime.new(2012, 10, 18, 6.5)
  },
  {
    chapter_id: @london.id,
    start_time: DateTime.new(2012, 11, 15, 6.5)
  }
])

Challenge.create([
  {
    gig_id: @northernsoul.id,
    active: true,
    featured: true,
    title: 'Signposts',
    venture_id: Venture.find_by_name('Signposts').id,
    description: 'Signposts are a local charity offering advice and support to a broad range of hard to reach/vulnerable people including the homeless. They need a new image and communication strategy, and all of the assets that usually go along with that, so there\'s plenty to go at!'
  },
  {
    gig_id: @northernsoul.id,
    active: true,
    title: 'Carbon Coop',
    venture_id: Venture.find_by_name('Carbon Coop').id,
    description: 'Carbon Coop are a group of Greater Manchester residents who\'ve teamed up to work together on improving their homes\' energy efficiency. They\'re doing exciting things with the collection and use of data, and if you\'re a technologist, tinkerer, coder, or user-interface designer, you\'re going to love this brief!'
  },
  {
    gig_id: @northernsoul.id,
    active: true,
    title: 'Mountains of Hope',
    venture_id: Venture.find_by_name('Mountains of Hope').id,
    description: 'Mountains of Hope work with children from the most disadvantaged areas of the UK, using small personal and group challenges to inspire them to plan an action packed day of fun in the mountains. Mountains of Hope need a brand identity and a social media presence - another brief with plenty to get your teeth into!'
  },
  {
    gig_id: @wildthing.id,
    active: true
  },
  {
    gig_id: @sol.id,
    venture_id: Venture.find_by_name('hiSbe').id,
    active: true
  },
  {
    gig_id: @sol.id,
    venture_id: Venture.find_by_name('Stay up Late').id,
    active: true
  },
  {
    gig_id: @sol.id,
    venture_id: Venture.find_by_name('PricePie').id,
    active: true
  },
  {
    gig_id: @madeinlambeth.id,
    title: 'Healthwatch',
    active: true
  },
  {
    gig_id: @madeinlambeth.id,
    title: 'Digital',
    active: true
  },
  {
    gig_id: @madeinlambeth.id,
    title: 'Parks',
    active: true
  },
  {
    gig_id: @madeinlambeth_2.id,
    title: 'MIL 2 B 1',
    active: true
  },
  {
    gig_id: @madeinlambeth_2.id,
    title: 'MIL 2 B 2',
    active: true
  },
  {
    gig_id: @madeinlambeth_2.id,
    title: 'MIL 2 B 3',
    active: true
  },
  {
    gig_id: @ecclesiastical_2.id,
    venture_id: Venture.find_by_name('Stirchley Food Co-op').id,
    active: true
  },
  {
    gig_id: @ecclesiastical_2.id,
    venture_id: Venture.find_by_name('Continental Star FC').id,
    active: true
  },
  {
    gig_id: @ecclesiastical_2.id,
    venture_id: Venture.find_by_name('Jericho Foundation').id,
    active: true
  },
  {
    gig_id: @openlabs.id,
    title: 'Communications',
    active: true
  },
  {
    gig_id: @openlabs.id,
    title: 'Genetic Analysis',
    active: true
  },
  {
    gig_id: @openlabs.id,
    title: 'Cell Analysis',
    active: true
  },
  {
    gig_id: @fallonshift.id,
    venture_id: Venture.find_by_name('The Abundance Network').id,
    active: true
  },
  {
    gig_id: @fallonshift.id,
    venture_id: Venture.find_by_name('Special Effect').id,
    active: true
  },
  {
    gig_id: @fallonshift.id,
    venture_id: Venture.find_by_name('Open Cinema').id,
    active: true
  },
  {
    gig_id: @maketime.id,
    venture_id: Venture.find_by_name('Thames 21').id,
    active: true
  },
  {
    gig_id: @maketime.id,
    venture_id: Venture.find_by_name('Espace Benevolat').id,
    active: true
  },
  {
    gig_id: @maketime.id,
    title: "Hack the U+ Source",
    active: true
  },
  {
    gig_id: @bluemonday.id,
    venture_id: Venture.find_by_name('The DoNation').id,
    active: true
  },
  {
    gig_id: @bluemonday.id,
    venture_id: Venture.find_by_name('PopUp Festival of Stories').id,
    active: true
  },
  {
    gig_id: @bluemonday.id,
    venture_id: Venture.find_by_name('Sustaination').id,
    active: true
  },
  {
    gig_id: @readinguni.id,
    venture_id: Venture.find_by_name('Homeless SMS').id,
    active: true
  },
  {
    gig_id: @readinguni.id,
    venture_id: Venture.find_by_name('Hackney Yoga Project').id,
    active: true
  },
  {
    gig_id: @readinguni.id,
    venture_id: Venture.find_by_name('Good Gym').id,
    active: true
  },
  {
    gig_id: @hackneyyoga.id,
    venture_id: Venture.find_by_name('Hackney Yoga Project').id,
    active: true
  },
  {
    gig_id: @ecclesiastical.id,
    venture_id: Venture.find_by_name('Young Gloucestershire').id,
    active: true
  },
  {
    gig_id: @ecclesiastical.id,
    venture_id: Venture.find_by_name('Cotswold Care Hospice').id,
    active: true
  },
  {
    gig_id: @ecclesiastical.id,
    venture_id: Venture.find_by_name('Gloucestershire Young Carers').id,
    active: true
  },
  {
    gig_id: @loveriot.id,
    venture_id: Venture.find_by_name('50/50 Make or Break').id,
    active: true
  },
  {
    gig_id: @newblood.id,
    venture_id: Venture.find_by_name('Homeless SMS').id,
    active: true
  },
  {
    gig_id: @newblood.id,
    venture_id: Venture.find_by_name('Good Gym').id,
    active: true
  },
  {
    gig_id: @newblood.id,
    venture_id: Venture.find_by_name('Bethnal Green Ventures').id,
    active: true
  },
  {
    gig_id: @gfn_2.id,
    venture_id: Venture.find_by_name('GnewtCargo').id,
    active: true
  },
  {
    gig_id: @gfn_2.id,
    venture_id: Venture.find_by_name('FoodCycle').id,
    active: true
  },
  {
    gig_id: @gfn_2.id,
    venture_id: Venture.find_by_name('Bletchley Park').id,
    active: true
  },
  {
    gig_id: @gfn_1.id,
    venture_id: Venture.find_by_name('Global Generation').id,
    active: true
  },
  {
    gig_id: @gfn_1.id,
    venture_id: Venture.find_by_name('Good Gym').id,
    active: true
  },
  {
    gig_id: @gfn_1.id,
    venture_id: Venture.find_by_name('Great Football Giveaway').id,
    active: true
  }
])
  