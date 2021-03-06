\name{gSymdifference}
\alias{gSymdifference}
\title{Geometry Symmetric Difference}
\description{Function for determining the symmetric difference between the two given geometries }
\usage{
gSymdifference(spgeom1, spgeom2, byid=FALSE, id=NULL, drop_lower_td=FALSE,
 unaryUnion_if_byid_false=TRUE, checkValidity=NULL)
}

\arguments{
  \item{spgeom1, spgeom2}{sp objects as defined in package sp}
  \item{byid}{Logical vector determining if the function should be applied across ids (TRUE) or the entire object (FALSE) for spgeom1 and spgeom2}
  \item{id}{Character vector defining id labels for the resulting geometries, if unspecified returned geometries will be labeled based on their parent geometries' labels.}
  \item{drop_lower_td}{default FALSE; if TRUE, objects will be dropped from output GEOMETRYCOLLECTION objects to simplify output if their topological dinension is less than the minimum topological dinension of the input objects.}
  \item{unaryUnion_if_byid_false}{default TRUE; if \code{byid} takes a FALSE in either position, the subgeometries are combined first to avoid possible topology exceptions (change in 0.3-13, previous behaviour did not combine subgeometries, and may be achieved by setting this argument FALSE}
  \item{checkValidity}{default NULL, integer 0L (no action), 1L (check), 2L (check and try to buffer by zero distance to repair). If NULL, a value set to 0L for GEOS < 3.7.2, 1L for GEOS >= 3.7.2 is read from values assigned on load. Error meesages from GEOS do not say clearly which object fails if a topology exception is encountered. If this argument is > 0L, \code{gIsValid} is run on each in turn}
}

\details{Returns the regions of spgeom1 and spgeom2 that do not intersect. If the geometries do not intersect then spgeom1 and spgeom2 will be returned as separate subgeometries.}

\note{Error messages from GEOS, in particular topology exceptions, report 0-based object order, so geom 0 is spgeom1, and geom 1 is spgeom2.}

\author{Roger Bivand & Colin Rundel}

\seealso{
\code{\link{gDifference}}
\code{\link{gIntersection}}
\code{\link{gUnion}}
}

\examples{
x = readWKT("POLYGON ((0 0, 0 10, 10 10, 10 0, 0 0))")
y = readWKT("POLYGON ((5 5, 15 5, 15 15, 5 15, 5 5))")

d = gSymdifference(x,y)
plot(d,col='red',pbg='white')
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{spatial}

