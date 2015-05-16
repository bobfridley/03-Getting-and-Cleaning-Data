# websites with passwords
# not authenticated
# return http status 401
pg1 = GET("http://httpbin.org/basic-auth/user/passwd")
print(pg1)

# authenticated website
# return http status 200 (authenticated)
pg2 = GET("http://httpbin.org/basic-auth/user/passwd",
          authenticate("user","passwd"))
print(pg2)

n <- names(pg2)
print(n)

# get content
c <- content(pg2, as="parsed")
print(c)