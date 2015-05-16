# handles
# use handles to save authentication across multiple GETs
google = handle("http://google.com")
pg1 = GET(handle=google,path="/")
pg2 = GET(handle=google,path="search")

print(pg1)
print(pg2)