require 'spec_helper'

describe Moment do
  use_vcr_cassette('jobs',
                   :record => :new_episodes,
                   :match_requests_on => [:method, :uri])

  before(:each) do
    @moment_api = Moment::API.new('3QVVwmAkZ93h_vQhLlrA')
    @uri = 'http://www.test.com:80/some_endpoint'
    @test_job_id = 'ZtaQiiEd'
  end

  context "list job" do
    it "returns a list of current jobs id's" do
      response = @moment_api.list_jobs

      response.length.should eql(2)
    end
  end

  context "create job" do
    it "should queue a new job" do
      schedule_time = '2100-01-31 18:36:21 -0400'

      response = @moment_api.create_job(@uri,schedule_time)

      response.should_not be_nil
      response['id'].should_not be_nil
      response['at'].should eql(schedule_time)
      response['uri'].should eql(@uri)
    end

    it "should not create job with invalid date" do
      schedule_time = '2000-01-31 18:36:21 -0400'

      ->{ @moment_api.create_job(@uri,schedule_time) }.should raise_error('Invalid parameter.  Date cannot be in the past.')
    end

    it "should not create job with invalid uri" do
      schedule_time = '2100-01-31 18:36:21 -0400'

      ->{ @moment_api.create_job('invalid uri',schedule_time) }.should raise_error('Invalid parameter.  Make sure you include a valid HTTP port (i.e. 80).')
    end
  end

  context "update_job" do
    it "should update a existing job" do
      schedule_time = '2101-01-31 18:36:21 -0400'

      response = @moment_api.update_job(@test_job_id,@uri,schedule_time)

      response.should_not be_nil
      response['at'].should eql(schedule_time)
    end

    it "should throw error if job id is invalid" do
      -> { @moment_api.update_job('invalid_job') }.should raise_error
    end
  end

  context "delete job" do
    it "should remove a existing job from the queue" do
      response = @moment_api.delete_job(@test_job_id)
      response.should be_true
    end

    it "should throw error if job id is invalid" do
      -> { @moment_api.delete_job('invalid_job') }.should raise_error
    end
  end
end
