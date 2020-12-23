#!/usr/bin/env ruby
require "uri"
require "net/http"
require 'json'
require 'progress'

token = ''

attempts = 10

pendings = 0

threads = []

(0...attempts).each do |num|

    threads << Thread.new {
  
        url = URI("https://sandbox-api.va.gov/services/claims/v1/forms/526")

        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true

        request = Net::HTTP::Post.new(url)
        request["X-VA-SSN"] = "796127677"
        request["X-VA-First-Name"] = "Janet"
        request["X-VA-Last-Name"] = "Moore"
        request["X-VA-Birth-Date"] = "1949-05-06"
        request["Content-Type"] = "application/json"
        request["Authorization"] = "Bearer #{token}"
        request.body = {
            'data' => {
              'type' => 'form/526',
              'attributes' => {
                'veteran' => {
                  'currentlyVAEmployee' => false,
                  'currentMailingAddress' => {
                    'city' => 'Portland',
                    'country' => 'USA',
                    'zipFirstFive' => (0..4).map{rand(0..4)}.join,
                    'addressLine1' => '1234 Couch Street',
                    'addressLine2' => 'Apt. 22',
                    'type' => 'DOMESTIC',
                    'zipLastFour' => (0..3).map{rand(0..3)}.join,
                    'state' => 'OR'
                  }
                },
                'claimantCertification' => true,
                'disabilities' => [
                  {
                    'ratedDisabilityId' => (0..6).map{rand(0..6)}.join,
                    'diagnosticCode' => (0..3).map{rand(0..3)}.join.to_i,
                    'disabilityActionType' => 'NEW',
                    'name' => 'PTSD (post traumatic stress disorder)',
                    'secondaryDisabilities' => [
                      {
                        'name' => 'PTSD personal trauma',
                        'disabilityActionType' => 'SECONDARY',
                        'serviceRelevance' => 'Caused by a service-connected disability\\nLengthy description'
                      }
                    ]
                  }
                ],
                'standardClaim' => false,
                'autoCestPDFGenerationDisabled' => false,
                'applicationExpirationDate' => '2015-08-28T19:53:45+00:00',
                'serviceInformation' => {
                  'servicePeriods' => [
                    {
                      'activeDutyEndDate' => '1990-01-02',
                      'serviceBranch' => 'Air Force',
                      'activeDutyBeginDate' => '1980-02-05'
                    },
                    {
                      'activeDutyEndDate' => '1999-01-01',
                      'serviceBranch' => 'Air Force Reserves',
                      'activeDutyBeginDate' => '1990-04-05'
                    }
                  ]
                }
              }
            }
          }.to_json
        begin
            put_response = https.request(request)
            puts Time.now
            puts "status: #{put_response.code}"
            puts put_response.body.inspect
          rescue => e
            pendings = pendings + 1
            puts e.inspect
          end

    }

end

threads.with_progress.each { |thr| thr.join }

puts "Total Attempts: #{attempts}"
puts "Total Failures: #{pendings}"
puts "Error rate: #{(100.0/attempts)*pendings}"