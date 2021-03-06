#!/usr/bin/env ruby
require 'sinatra'

# Set production so bind listens on 0.0.0.0 by default
set :environment, :production

statushash = Hash.new
statushash["100"] = "Continue"
statushash["101"] = "Switching Protocols"
statushash["102"] = "Processing"
statushash["200"] = "OK"
statushash["201"] = "Created"
statushash["202"] = "Accepted"
statushash["203"] = "Non-Authoritative Information"
statushash["204"] = "No Content"
statushash["205"] = "Reset Content"
statushash["206"] = "Partial Content"
statushash["207"] = "Multi-Status"
statushash["208"] = "Already Reported"
statushash["226"] = "IM Used"
statushash["300"] = "Multiple Choices"
statushash["301"] = "Moved Permanently"
statushash["302"] = "Found"
statushash["303"] = "See Other"
statushash["304"] = "Not Modified"
statushash["305"] = "Use Proxy"
statushash["306"] = "Switch Proxy"
statushash["307"] = "Temporary Redirect"
statushash["308"] = "Permanent Redirect"
statushash["400"] = "Bad Request"
statushash["401"] = "Unauthorized"
statushash["402"] = "Payment Required"
statushash["403"] = "Forbidden"
statushash["404"] = "Not Found"
statushash["405"] = "Method Not Allowed"
statushash["406"] = "Not Acceptable"
statushash["407"] = "Proxy Authentication Required"
statushash["408"] = "Request Timeout"
statushash["409"] = "Conflict"
statushash["410"] = "Gone"
statushash["411"] = "Length Required"
statushash["412"] = "Precondition Failed"
statushash["413"] = "Request Entity Too Large"
statushash["414"] = "Request-URI Too Long"
statushash["415"] = "Unsupported Media Type"
statushash["416"] = "Requested Range Not Satisfiable"
statushash["417"] = "Expectation Failed"
statushash["418"] = "I'm a teapot"
statushash["419"] = "Authentication Timeout"
statushash["420"] = "Method Failure"
statushash["422"] = "Unprocessable Entity"
statushash["423"] = "Locked"
statushash["424"] = "Failed Dependency"
statushash["426"] = "Upgrade Required"
statushash["428"] = "Precondition Required"
statushash["429"] = "Too Many Requests"
statushash["431"] = "Request Header Fields Too Large"
statushash["440"] = "Login Timeout"
statushash["444"] = "No Response"
statushash["449"] = "Retry With"
statushash["450"] = "Blocked by Windows Parental Controls"
statushash["451"] = "Unavailable For Legal Reasons"
statushash["451"] = "Redirect"
statushash["494"] = "Request Header Too Large"
statushash["495"] = "Cert Error"
statushash["496"] = "No Cert"
statushash["497"] = "HTTP to HTTPS"
statushash["498"] = "Token expired/invalid"
statushash["499"] = "Client Closed Request"
statushash["500"] = "Internal Server Error"
statushash["501"] = "Not Implemented"
statushash["502"] = "Bad Gateway"
statushash["503"] = "Service Unavailable"
statushash["504"] = "Gateway Timeout"
statushash["505"] = "HTTP Version Not Supported"
statushash["506"] = "Variant Also Negotiates"
statushash["507"] = "Insufficient Storage"
statushash["508"] = "Loop Detected"
statushash["509"] = "Bandwidth Limit Exceeded"
statushash["510"] = "Not Extended"
statushash["511"] = "Network Authentication Required"
statushash["598"] = "Network read timeout error"
statushash["599"] = "Network connect timeout error"
statushash["701"] = "Meh"
statushash["702"] = "Emacs"
statushash["703"] = "Explosion"
statushash["704"] = "Goto Fail"
statushash["705"] = "I wrote the code and missed the necessary validation by an oversight (see 795)"
statushash["710"] = "PHP"
statushash["711"] = "Convenience Store"
statushash["712"] = "NoSQL"
statushash["719"] = "I am not a teapot"
statushash["720"] = "Unpossible"
statushash["721"] = "Known Unknowns"
statushash["722"] = "Unknown Unknowns"
statushash["723"] = "Tricky"
statushash["724"] = "This line should be unreachable"
statushash["725"] = "It works on my machine"
statushash["726"] = "It's a feature, not a bug"
statushash["727"] = "32 bits is plenty"
statushash["730"] = "Fucking Bower"
statushash["731"] = "Fucking Rubygems"
statushash["732"] = 'Fucking Unic<g-emoji alias="hankey" fallback-src="https://assets-cdn.github.com/images/icons/emoji/unicode/1f4a9.png">💩</g-emoji>de'
statushash["733"] = "Fucking Deadlocks"
statushash["734"] = "Fucking Deferreds"
statushash["735"] = "Fucking IE"
statushash["736"] = "Fucking Race Conditions"
statushash["737"] = "FuckThreadsing"
statushash["738"] = "Fucking Bundler"
statushash["739"] = "Fucking Windows"
statushash["740"] = "Computer says no"
statushash["741"] = "Compiling"
statushash["742"] = "A kitten dies"
statushash["743"] = "I thought I knew regular expressions"
statushash["744"] = "Y U NO write integration tests?"
statushash["745"] = "I don't always test my code, but when I do I do it in production"
statushash["746"] = "Missed Ballmer Peak"
statushash["747"] = "Motherfucking Snakes on the Motherfucking Plane"
statushash["748"] = "Confounded by Ponies"
statushash["749"] = "Reserved for Chuck Norris"
statushash["750"] = "Didn't bother to compile it"
statushash["753"] = "Syntax Error"
statushash["754"] = "Too many semi-colons"
statushash["755"] = "Not enough semi-colons"
statushash["756"] = "Insufficiently polite"
statushash["757"] = "Excessively polite"
statushash["759"] = "Unexpected T_PAAMAYIM_NEKUDOTAYIM"
statushash["761"] = "Hungover"
statushash["762"] = "Stoned"
statushash["763"] = "Under-Caffeinated"
statushash["764"] = "Over-Caffeinated"
statushash["765"] = "Railscamp"
statushash["766"] = "Sober"
statushash["767"] = "Drunk"
statushash["768"] = "Accidentally Took Sleeping Pills Instead Of Migraine Pills During Crunch Week"
statushash["769"] = "Questionable Maturity Level"
statushash["771"] = "Cached for too long"
statushash["772"] = "Not cached long enough"
statushash["773"] = "Not cached at all"
statushash["774"] = "Why was this cached?"
statushash["775"] = "Out of cash"
statushash["776"] = "Error on the Exception"
statushash["777"] = "Coincidence"
statushash["778"] = "Off By One Error"
statushash["779"] = "Off By Too Many To Count Error"
statushash["780"] = "Project owner not responding"
statushash["781"] = "Operations"
statushash["782"] = "QA"
statushash["783"] = "It was a customer request, honestly"
statushash["784"] = "Management, obviously"
statushash["785"] = "TPS Cover Sheet not attached"
statushash["786"] = "Try it now"
statushash["787"] = "Further Funding Required"
statushash["788"] = "Designer's final designs weren't"
statushash["791"] = "The Internet shut down due to copyright restrictions."
statushash["792"] = "Climate change driven catastrophic weather event"
statushash["793"] = "Zombie Apocalypse"
statushash["794"] = "Someone let PG near a REPL"
statushash["795"] = "#heartbleed (see 705)"
statushash["797"] = "This is the last page of the Internet. Go back"
statushash["799"] = "End of the world"

get '/' do
  randomstatus = statushash.keys.sample
  message = statushash[randomstatus]
  status randomstatus
  if randomstatus.start_with? '7'
    body "<center><h1>Status code #{randomstatus}</h1><br><br><h2>#{message}<br>\
          <h3>This status code was pulled from<br>\
          <a href=https://github.com/joho/7XX-rfc>https://github.com/joho/7XX-rfc</a></center></h2>"
  else
    body "<center><h1>Status code #{randomstatus}</h1><br><br><h2>#{message}<br>\
          <h3>This status code was pulled from<br>\
          <a href=https://en.wikipedia.org/wiki/List_of_HTTP_status_codes>https://en.wikipedia.org/wiki/List_of_HTTP_status_codes</a></center></h2>"
  end
end

get '/:status' do
  randomstatus = "#{params[:status]}"
  message = statushash[randomstatus]
  status randomstatus
  if statushash.has_key?(randomstatus)
    if randomstatus.start_with? '7'
      body "<center><h1>Status code #{randomstatus}</h1><br><br><h2>#{message}<br>\
            <h3>This status code was pulled from<br>\
            <a href=https://github.com/joho/7XX-rfc>https://github.com/joho/7XX-rfc</a></center></h2>"
    else
      body "<center><h1>Status code #{randomstatus}</h1><br><br><h2>#{message}<br>\
            <h3>This status code was pulled from<br>\
            <a href=https://en.wikipedia.org/wiki/List_of_HTTP_status_codes>https://en.wikipedia.org/wiki/List_of_HTTP_status_codes</a></center></h2>"
    end
  else
    body "<center>Your status code does not exist at\
          <br><a href=https://en.wikipedia.org/wiki/List_of_HTTP_status_codes>https://en.wikipedia.org/wiki/List_of_HTTP_status_codes</a>\
          <br> nor <br>\
          <a href=https://github.com/joho/7XX-rfc>https://github.com/joho/7XX-rfc</a>\
          <br>If you feel this is an error/oversight. Please subit a bug report at<br>\
          <a href=https://github.com/Jmainguy/openshift-statuscode>https://github.com/Jmainguy/openshift-statuscode</a></center>"
  end
end
