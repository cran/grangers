% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Granger_inference_difference.R
\name{Granger.inference.difference}
\alias{Granger.inference.difference}
\title{Inference on the difference between unconditional and conditional Granger-causality}
\usage{
Granger.inference.difference(x, y, z, ic.chosen = "SC",
  max.lag = min(4, length(x) - 1), plot = F, type.chosen = "none",
  p = 0, p1 = 0, p2 = 0, nboots = 1000, conf = 0.95,
  bp_orig = NULL, ts_boot = 1)
}
\arguments{
\item{x}{univariate time series.}

\item{y}{univariate time series (of the same length of \verb{x}).}

\item{z}{univariate time series (of the same length of \verb{x}).}

\item{ic.chosen}{estimation method parameter \verb{ic} to be passed to function \link[vars]{VAR} of
package ''vars''. Defaults to ''SC'' (Schwarz criterion). Alternatives are \verb{c(''AIC'',''HQ'',''SC'',''FPE'')}.}

\item{max.lag}{maximum number of lags \verb{lag.max} to be passed to function \code{\link[vars]{VAR}}.
Defaults to \verb{min(4, length(x) - 1)}.}

\item{plot}{logical; if TRUE, it returns the plot of the difference between the unconditional
    Granger-causality spectrum from \verb{y} to \verb{x} and the conditional Granger-causality
    spectrum from \verb{y} to \verb{x} on \verb{z} with upper and lower computed thresholds.
Defaults to FALSE.}

\item{type.chosen}{parameter \verb{type} to be passed to function \code{\link[vars]{VAR}}.
Defaults to \verb{''none''}. Alternatives are \verb{c(''none'',''const'',''trend'')}.}

\item{p}{parameter \verb{p} to be passed to function \link[vars]{VAR}.
It corresponds to the number of delays for unconditional GC. Defaults to 0.}

\item{p1}{parameter \verb{p} to be passed to function \link[vars]{VAR}.
It corresponds to the number of lags of the first VAR model. Defaults to 0.}

\item{p2}{parameter \verb{p} to be passed to function \link[vars]{VAR}.}

\item{nboots}{number of bootstrap series to be computed by function \code{\link[tseries]{tsbootstrap}}
of package \href{https://CRAN.R-project.org/package=tseries}{tseries}. It defaults to 1000.}

\item{conf}{prescribed confidence level. It defaults to 0.95.}

\item{bp_orig}{matrix containing previously simulated bootstrap series, having as rows
time points, as columns variables \verb{x} and \verb{y} (in this order). It defaults to NULL.}

\item{ts_boot}{boolean equal to 1 if the stationary bootstrap of 
Politis and Romano (1994) is applied, 0 otherwise. It defaults to 1.}
}
\value{
\verb{frequency}: frequencies used by Fast Fourier Transform.

\verb{n}: time series length.

\verb{nboots}: number of bootstrap series used.

\verb{confidence_level}: prescribed confidence level.

\verb{stat_yes}: boolean equal to 0 if no stationary VAR 
	is estimated across bootstrap samples, 1 otherwise.

\verb{non_stationarity_rate}: percentage of estimated non-stationary VAR models (at
	least one root larger than one) on bootstrapped \verb{x} and {y}.

\verb{non_stationarity_rate_1}: percentage of estimated non-stationary VAR models (at
	least one root larger than one) on bootstrapped \verb{x} and {z}.

\verb{non_stationarity_rate_2}: percentage of estimated non-stationary VAR models (at
	least one root larger than one) on bootstrapped \verb{x}, \verb{y} and {z}.

\verb{quantile_difference_inf}: lower computed quantile of the difference between the
	Granger-causality unconditional spectrum from \verb{y} to \verb{x} and the Granger-causality
	conditional spectrum from \verb{y} to \verb{x} on \verb{z}.

\verb{quantile_difference_sup}: upper computed quantile of the difference between the
	Granger-causality unconditional spectrum from \verb{y} to \verb{x} and the Granger-causality
	conditional spectrum from \verb{y} to \verb{x} on \verb{z}.

\verb{freq_inf}: frequencies at which the difference between the Granger-causality unconditional spectrum 
from \verb{y} to \verb{x} and the Granger-causality conditional spectrum
	from \verb{y} to \verb{x} on \verb{z} exceeds the lower computed threshold.

\verb{freq_sup}: frequencies at which the difference between the Granger-causality unconditional spectrum 
from \verb{y} to \verb{x} and the Granger-causality conditional spectrum
	from \verb{y} to \verb{x} on \verb{z} exceeds the upper computed threshold.

\verb{quantile_difference_max_inf}: lower computed quantile of the difference between the
	Granger-causality unconditional spectrum from \verb{y} to \verb{x} and the Granger-causality
	conditional spectrum from \verb{y} to \verb{x} on \verb{z} under Bonferroni correction.

\verb{quantile_difference_max_sup}: upper computed quantile of the difference between the
	Granger-causality unconditional spectrum from \verb{y} to \verb{x} and the Granger-causality
	conditional spectrum from \verb{y} to \verb{x} on \verb{z} under Bonferroni correction.

\verb{freq_max_inf}: frequencies at which the difference between the Granger-causality unconditional 
spectrum from \verb{y} to \verb{x} and the Granger-causality conditional spectrum
	from \verb{y} to \verb{x} on \verb{z} exceeds the lower computed threshold under Bonferroni correction.

\verb{freq_max_sup}: frequencies at which the difference between the Granger-causality unconditional 
spectrum from \verb{y} to \verb{x} and the Granger-causality conditional spectrum
	from \verb{y} to \verb{x} on \verb{z} exceeds the upper computed threshold under Bonferroni correction.

The result is returned invisibly if plot is TRUE.
}
\description{
Inference on the difference between unconditional and conditional Granger-causality
	spectrum is provided generating bootstrap time series by the stationary boostrap of
	Politis and Romano (1994).
	For computational details we refer to Ding et al. (2006) and Farne' and Montanari (2018).
}
\details{
\verb{Granger.inference.difference} provides bootstrap inference for the difference between
	the Granger-causality unconditional spectrum of a time series \verb{x} (effect variable)
	respect to a time series \verb{y} (cause variable) and the Granger-causality conditional
	spectrum of a time series \verb{x} (effect variable) on a time series \verb{z} (conditioning variable)
	respect to a time series \verb{y} (cause variable). It requires packages \href{https://CRAN.R-project.org/package=vars}{vars} and \href{https://CRAN.R-project.org/package=tseries}{tseries}.
}
\examples{
	RealGdp.rate.ts<-euro_area_indicators[,1]
m3.rate.ts<-euro_area_indicators[,2]
hicp.rate.ts<-euro_area_indicators[,4]
	inf_diff_pre_hicp.to.gdp_0.95<-
	Granger.inference.difference(RealGdp.rate.ts,m3.rate.ts,hicp.rate.ts,nboots=10)
}
\references{
Politis D. N. and Romano  J. P., (1994). ''The Stationary
   Bootstrap''. \emph{Journal of the American Statistical Association}, 89, 1303--1313.

Ding, M., Chen, Y., Bressler, S.L., 2006. Granger Causality: Basic Theory and
	Application to Neuroscience, Chap.17. \emph{Handbook of Time Series Analysis
	Recent Theoretical Developments and Applications}.

Farne', M., Montanari, A., 2018. A bootstrap test to detect prominent Granger-causalities across frequencies. 
<arXiv:1803.00374>, \emph{Submitted}.
}
\seealso{
\link[vars]{VAR} and \code{\link[tseries]{tsbootstrap}}.
}
\author{
Matteo Farne', Angela Montanari, \email{matteo.farne2@unibo.it}
}
