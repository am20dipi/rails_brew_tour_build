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
 - Render: (view)
        - objects remain, pre-filled forms
 - Redirect: (/url) 
        - incurs a new page load; since HTTP is stateless, the browser throws everything out after each request (except for cookies, session hash).
        - when we redirect after a validation failure, we lose the instance variable.

 Authenticity Token(s):
 - the token proves/ensures the forms are being submitted on the right website.
 - Rails stores the token in the session object: 
    - when a form is submitted, Rails checks that the form's token matches the session's token
 - we are provided the authenticity token(s) through form_for, form_with




def index
        # how can I check if this is nested?
        if params[:beer_id] && @beer = Beer.find_by_id(params[:beer_id])
            # this means nested; if the url has .../:beer_id/...
            # AND if @beer is NIL then find the instance of beer by its id
            @reviews = @beer.reviews
        else
            @error = "That beer does not exist." if params[:beer_id]
            @reviews = Review.all.newest_to_oldest
        end
        # this ensures that the params are a true value; so one does not type "/beers/ruibnfouenofw/reviews" and retrieve results
    end


    def new
        # if it is nested and we find the beer
        if params[:beer_id] && @beer = Beer.find_by_id(params[:beer_id])
            @review = @beer.reviews.build 
        else
            @review = Review.new
            #form_builders require instance variables
        end
    end