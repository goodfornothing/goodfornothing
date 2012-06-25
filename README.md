Good for Nothing Platform
================

An embryonic platform to support and amplify the Good for Nothing communities' efforts.

### Basic platform architecture

![Good for Nothing Platform Architecture](http://www.goodfornothing.com/uml.png)

## Extra useful stuff

#### Mailchimp/Devise integration

User accounts are tied to a Mailchimp subscriber lists. Users can edit their preferences on their profile page. 

Set your API key and list name in `config/initializers/devise.rb`.

    Devise.mailchimp_api_key = 'apikey'
    Devise.mailing_list_name = 'Name of List'

#### Facebook Events

Gigs can be published to Facebook as 'Events'.

## Datum factories

#### Wordpress

You can import posts from standard Wordpress eXtended RSS formatted files to the Blog::Posts and Blog::Category models using the following rake task:

    rake wordpress:import filename

Images referenced in posts will be downloaded and stored locally, image tags will be updated to reference these local files.

Post and category relationships will be maintained.  

#### Bookmarks 

The Netscape Bookmark format, surprisingly, is still rather common (Read it Later, Chrome, Firefox). Use this task to import bookmarks and tags into the Library::Bookmark and Library::Tag models.

    rake bookmarks:import filename

Bookmark and tag relationships will be maintained.

#### Ning user

Used to import a CSV Ning user list to a NingProfile model and map it to a core Devise User model.

    rake ning:import filename

## We're working on it...

This is phase one. See [this post](http://www.goodfornothing.com) for more about how we plan to roll out features.

There are a few things still to implement in this phase:

 - User commenting for:
   - Blog posts
   - Gigs
 - Email notifications when
   - New users register
   - Users register for gigs
 - The ability to send email to gigs' attendees
 - Localisation

## License

The MIT License (MIT)
Copyright © 2012 Good for Nothing, http://goodfornothing.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.