Moment
======

Moment is a very basic ruby library for the [moment](http://www.momentapp.com) api.

Usage
====

    moment_api = Moment::API.new('Your_API_Key')

####List jobs
    moment_api.list_jobs 
    #=> ['ZtaQiiEd','ZtaQiifs']

####Create a job

    moment_api.create_job('http://test.com:80/', '2100-01-31 18:36:21 -0400')
    #=> {"id"=>"ZtaQiiEd", "uri"=>"http://test.com:80/", "at"=>"2100-01-31 18:36:21 -0400"}

####Update a job

    moment_api.update_job('http://test.com:80/', '2200-01-31 18:36:21 -0400')
    #=> {"id"=>"ZtaQiiEd", "uri"=>"http://test.com:80/", "at"=>"2100-01-31 18:36:21 -0400"}

####Delete a job
    moment_api.update_job('ZtaQiiEd')
    #=> true

Info About the Moment Api
====
MomentApp [Docs](http://www.momentapp.com/docs)
