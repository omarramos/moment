require 'httparty'

module Moment
  class API
    include HTTParty

    base_uri 'https://momentapp.com'
    format :json

    def initialize(key)
      self.class.default_params :apikey => key
    end

    def list_jobs
      response = self.class.get('/jobs.json')
      check_for_errors(response)
      response['success']['jobs']
    end

    #MomentApi options: uri, method, at, limit = 0, callback = nil
    def create_job(job_url,at)
      options = { query: {job: {method: 'POST', at: at, uri: job_url}} }

      response = self.class.post('/jobs.json', options)
      check_for_errors(response)
      response['success']['job']
    end

    def update_job(job_id,job_url,at)
      options = {
        query: { job: {method: 'PUT', at: at, uri: job_url} },
        headers: { 'Content-Length' => '0' } }

        response = self.class.put("/jobs/#{job_id}.json", options)
        check_for_errors(response)
        response['success']['job']
    end

    def delete_job(job_id)
      response = self.class.delete("/jobs/#{job_id}.json")
      check_for_errors(response)
      response['success']['message'] == 'Job deleted'
    end

    private

    def check_for_errors(response)
      raise APIError.new(response['error']) unless response['error'].nil?
      raise APIError.new(response) if response['success'].nil?
    end

  end

  class APIError < StandardError
    def initialize(details = {})
      super(details[details.keys.first])
    end
  end
end
