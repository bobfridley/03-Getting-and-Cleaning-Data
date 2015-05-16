# install biocLite package
#source("http://bioconductor.org/biocLite.R")
# 1st time install bio-base packages
#biocLite("rhdf5")

library(rhdf5)
# create a hdf5 file
# don't have to create explicitly
created = h5createFile("example.h5")
# returns TRUE (created) FALSE (not created)
print(created)

# create groups within the file
created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
# create subgroup of group foo
created = h5createGroup("example.h5", "foo/foobaa")
# list groups (similar to ls() command) in hdf5 file
h <- h5ls("example.h5")
print(h)

# create matrix A
A = matrix(1:10, nr=5, nc=2)
# write matrix A to group foo
h5write(A, "example.h5","foo/A")
# create multi-dimensional array
B = array(seq(0.1, 2.0, by=0.1), dim=c(5, 2, 2))
# add attribute with metadata
attr(B, "scale") <- "liter"
# write array B to subgroup foobaa
h5write(B, "example.h5", "foo/foobaa/B")
# list groups in hdf5 file
h <- h5ls("example.h5")
print(h)

# create dataset (data.frame)
df = data.frame(1L:5L, seq(0, 1, length.out=5),
        c("ab", "cde", "fghi", "a", "s"), stringsAsFactors=FALSE)
# write data.frame to top-level of hdf5 file
# top-level designated by "/"
h5write(df, "example.h5", "df")
# list groups in hdf5 file
h <- h5ls("example.h5")

# Reading data (using "=" rather than "<-")
readA = h5read("example.h5", "foo/A")
readB = h5read("example.h5"," foo/foobaa/B")
readdf= h5read("example.h5", "df")
print(readA)

H5close()
# Writing and Reading Chunks
# write elements 12,13,14 to rows 1:3 column 1 of A dataset
h5write(c(12, 13, 14), "example.h5", "foo/A", index=list(1:3, 1))
h <- h5read("example.h5", "foo/A")
print(h)
