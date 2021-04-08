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
