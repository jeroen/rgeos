\name{gSimplify}
\alias{gSimplify}

\title{Simplify Geometry}
\description{Function simplifies the given geometry using the Douglas-Peuker algorithm}
\usage{
	gSimplify(spgeom, tol, topologyPreserve=FALSE)
}

\arguments{
  \item{spgeom}{sp object as defined in package sp}
  \item{tol}{Numerical tolerance value to be used by the Douglas-Peuker algorithm}
  \item{topologyPreserve}{Logical determining if the algorithm should attempt to preserve the topology of the original geometry}
}

\value{Returns a simplified version of the given geometry when applied to [MULTI]LINEs or [MULTI]POLYGONs.}

\details{When applied to lines it is possible for the resulting geometry to lose simplicity (\code{\link{gIsSimple}}). If topologyPreserve is not specified it is also possible that the resulting geometries may no longer be valid (\code{\link{gIsValid}}). Remember to check the resulting geometry as many other functions rely on simplicity and or validity when performing their calculations.}

\author{Roger Bivand & Colin Rundel}

\references{
Douglas-Peuker Algorithm:
\url{https://en.wikipedia.org/wiki/Ramer-Douglas-Peucker_algorithm}
}


\examples{
p = readWKT(paste("POLYGON((0 40,10 50,0 60,40 60,40 100,50 90,60 100,60",
 "60,100 60,90 50,100 40,60 40,60 0,50 10,40 0,40 40,0 40))"))
l = readWKT("LINESTRING(0 7,1 6,2 1,3 4,4 1,5 7,6 6,7 4,8 6,9 4)")

par(mfrow=c(2,4))
plot(p);title("Original")
plot(gSimplify(p,tol=10));title("tol: 10")
plot(gSimplify(p,tol=20));title("tol: 20")
plot(gSimplify(p,tol=25));title("tol: 25")

plot(l);title("Original")
plot(gSimplify(l,tol=3));title("tol: 3")
plot(gSimplify(l,tol=5));title("tol: 5")
plot(gSimplify(l,tol=7));title("tol: 7")
par(mfrow=c(1,1))
}

\keyword{spatial}
