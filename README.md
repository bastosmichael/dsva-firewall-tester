# dsva-firewall-tester
Ruby code to test incidents when the VA firewall rejects binary pdf uploads but returns a 200 status

I don't include the apikey in the code but you can sign up for your own [Benefits Intake API](https://developer.va.gov/explore/benefits/docs/benefits?version=current) key at https://developer.va.gov/apply

Example run and output for test script.
```
michael@michael-Blade-Stealth:~/oddball-va/firewall-pdf-test$ ruby test.rb 
......2020-06-17 13:52:57 -0500
status: 200
cookies: {}
headers: {:cache_control=>"no-cache", :connection=>"close", :content_type=>"text/html; charset=utf-8", :pragma=>"no-cache", :content_length=>"783"}
"<html><head><title>Request Rejected</title></head><body>The requested URL was rejected.  <br><br>\r\n\r\nThe enhanced features of ServiceNow and Your IT services online requests will replace email requests to the Enterprise Service Desk.  You may access ServiceNow portal at <a href=\"https://yourit.va.gov\">https://yourit.va.gov</a> using the Chrome browser.  The tool is only available from VA workstations and will work with your Personal Identity Verification (PIV) card, eliminating the need for a username and password.  If you have additional questions, please contact Enterprise Service Desk (ESD) at 1-855-673-4357.\r\n\r\n<br><br>Please make sure to include the entire Support ID number.\r\n\r\n<br><br>Your support ID is: 578708302750716773<br>Appliance name: gwelb01-waf</body></html>"
content: pdf/GSA-2580.pdf
attachement: pdf/FL70-2.pdf
 20.0% (ETA: 29s)2020-06-17 13:53:09 -0500
status: 200
cookies: {}
headers: {:cache_control=>"no-cache", :connection=>"close", :content_type=>"text/html; charset=utf-8", :pragma=>"no-cache", :content_length=>"785"}
"<html><head><title>Request Rejected</title></head><body>The requested URL was rejected.  <br><br>\r\n\r\nThe enhanced features of ServiceNow and Your IT services online requests will replace email requests to the Enterprise Service Desk.  You may access ServiceNow portal at <a href=\"https://yourit.va.gov\">https://yourit.va.gov</a> using the Chrome browser.  The tool is only available from VA workstations and will work with your Personal Identity Verification (PIV) card, eliminating the need for a username and password.  If you have additional questions, please contact Enterprise Service Desk (ESD) at 1-855-673-4357.\r\n\r\n<br><br>Please make sure to include the entire Support ID number.\r\n\r\n<br><br>Your support ID is: 15885777123254907631<br>Appliance name: gwnlb01-waf</body></html>"
content: pdf/21P-0847.pdf
attachement: pdf/10-2850D.pdf
 30.0% (ETA: 30s)2020-06-17 13:53:12 -0500
status: 200
cookies: {}
headers: {:cache_control=>"no-cache", :connection=>"close", :content_type=>"text/html; charset=utf-8", :pragma=>"no-cache", :content_length=>"785"}
"<html><head><title>Request Rejected</title></head><body>The requested URL was rejected.  <br><br>\r\n\r\nThe enhanced features of ServiceNow and Your IT services online requests will replace email requests to the Enterprise Service Desk.  You may access ServiceNow portal at <a href=\"https://yourit.va.gov\">https://yourit.va.gov</a> using the Chrome browser.  The tool is only available from VA workstations and will work with your Personal Identity Verification (PIV) card, eliminating the need for a username and password.  If you have additional questions, please contact Enterprise Service Desk (ESD) at 1-855-673-4357.\r\n\r\n<br><br>Please make sure to include the entire Support ID number.\r\n\r\n<br><br>Your support ID is: 15885777123253171062<br>Appliance name: gwnlb01-waf</body></html>"
content: pdf/FL-10-341a.pdf
attachement: pdf/VA4597a.pdf
 70.0% (ETA: 16s)2020-06-17 13:53:38 -0500
status: 200
cookies: {}
headers: {:cache_control=>"no-cache", :connection=>"close", :content_type=>"text/html; charset=utf-8", :pragma=>"no-cache", :content_length=>"785"}
"<html><head><title>Request Rejected</title></head><body>The requested URL was rejected.  <br><br>\r\n\r\nThe enhanced features of ServiceNow and Your IT services online requests will replace email requests to the Enterprise Service Desk.  You may access ServiceNow portal at <a href=\"https://yourit.va.gov\">https://yourit.va.gov</a> using the Chrome browser.  The tool is only available from VA workstations and will work with your Personal Identity Verification (PIV) card, eliminating the need for a username and password.  If you have additional questions, please contact Enterprise Service Desk (ESD) at 1-855-673-4357.\r\n\r\n<br><br>Please make sure to include the entire Support ID number.\r\n\r\n<br><br>Your support ID is: 15885777123261520569<br>Appliance name: gwnlb01-waf</body></html>"
content: pdf/10-0459.pdf
attachement: pdf/22-8889.pdf
100.0% (elapsed: 53s)
Total Attempts: 10
Total Failures: 4
Error rate: 40.0
```

The goal here was to capture instances where the VA Firewall returned an error with a 200 closed response and in HTML instead of requested JSON type as well as make it easil replicatable for anyone wanting to try it out.
