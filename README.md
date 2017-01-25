# Page-Indexer
This is a sample RAILS-API Application that demonstrates [ WEB CRAWLING ]

## GEMS USED
- Nokogiri
- Mysql2
- Apipie [ for documentation ]

## Quick Setup
- Clone the repository
- run 'bundle install'
- open 'config/database.yml' and provde your local machine's MySQL username/password
- run 'rake db:create' 
- run 'rake db:migrate'
- run 'rails s' to start the rails server

## Production Deployment
I have added 'capistrano' gem to deploy to a DigitalOcean Droplet, but I noticed that this was not requested
However, I can continue later to add nginx.conf file and deploy.rb, setup multistage deployment using Capistrano / Nginx / Puma and DigitalOcean.

## API Documentation
- I have written only one API Endpoint to do both crawling and retreival of previously crawled pages
- The API will check if the link is already stored/crawled and will return already stored / processed data
- The link was never visited, it will crawl it and render the result
- The user can override a previously stored page by sending an override boolean flag to the API [ False by default ]
- The API is also documented using APIPIE
- After running the rails server, please nagivate to /api/docs
- The API Docs are set as the Project's Homepage as well
- Sample Request : 
POST /api/v1/pages/crawl
{
  "link" : "https://github.com",
  "override" : true
}
