Models:

Brewery
 - name
 - location 
 - year established


 User
 - name / username
 - email
 - password_digest


 Review
 - content
 - title
 - rating
 - beer_id 
 - user_id

 Beer 
 - name
 - abv
 - description 


 Associations:

 - User has_many Reviews [x]
 - A Review belongs_to a User [x]

 - User has_many Beers, through Reviews [x]
 - Beer has_many Users, through Reviews [x]

 - A Review belongs_to a Beer [x]
 - A Beer has_many Reviews  [x]

 - A Beer belongs_to a Brewery [x]
 - A Brewery has_many Beers [x]

 - A Beer belongs_to a User [x]



 Sessions/Cookies:
 - The session behaves like a hash: session[:user_id] = @user.id
 - A session is a datastore implemented with cookies.
 - Rails manages all session data in a single cookie, named _RAILS_BREW_TOUR_BUILD_session.. this serializes all the key/value pairs you set with session, converting them from a Ruby Object into a big string. 
 - Cookies let you store data in a user's browser. 
 - Cookies are primarily are used for log in. They provide a way for us to verify who a user is once, and then remember it for their entire session. 
 - Rails session method gives us access to the Rails session. 


 Nested Routes:
 - '/users/:id/beers'
 - '/users/:id/reviews'
 - '/beers/:id/reviews'
 - Nested Routes should be focused on the parent tables. 
 - Need two (2) for requirements: either new, show, or index. 
 -  


 RENDER V. REDIRECT
 - Render:
 - Redirect: 
        - incurs a new page load; since HTTP is stateless, the browser throws everything out after each request (except for cookies, session hash).
        - when we redirect after a validation failure, we lose the instance variable.

 Authenticity Token(s):
 - the token proves/ensures the forms are being submitted on the right website.
 - Rails stores the token in the session object: 
    - when a form is submitted, Rails checks that the form's token matches the session's token
 - we are provided the authenticity token(s) through form_for, form_with
