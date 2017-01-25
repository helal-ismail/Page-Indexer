Rails.application.routes.draw do

  apipie
  namespace 'api' do
    namespace 'v1' do
      namespace 'pages' do
        post 'crawl'
      end
    end
  end


end
