% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/optimize.R
\name{dk_prepare_schematic}
\alias{dk_prepare_schematic}
\title{Prepare Schematic}
\usage{
dk_prepare_schematic(
  draft_group_id,
  draft_group_exp_fp = NULL,
  draft_group = NULL,
  rules = NULL,
  include_players = NULL,
  exclude_players = NULL,
  exclude_questionable = FALSE
)
}
\arguments{
\item{draft_group_id}{Sequence of digits that correspond to a draft table/group.
If \code{draft_group_id} and \code{contest_key} are both passed, \code{contest_key} is ignored.}

\item{draft_group_exp_fp}{A data.frame with two columns \code{draftable_id}
(found in the output of \code{get_draftable_players()}) and \code{exp_fp}
(expected fantasy points). Note that the Showdown Captain Mode game type includes
two rows for each player/defense. If \code{draft_group} contains rows not found in
\code{draft_group_exp_fp}, then a warning is issued and those missing rows are dropped.
If \code{NULL} (the default), and \code{exp_fp} does not exist in \code{draft_group},
then \code{exp_fp} is set equal to the \code{ppg} value returned by \code{get_player_list()}.}

\item{draft_group}{Object returned by \code{get_draftable_players()}. If \code{NULL} (the default),
then this object is fetched using the \code{draft_group_id}. The following columns are required:
draftable_id, player_id, first_name, last_name, display_name, salary, team_id, status.}

\item{rules}{Object returned by \code{get_gametype_rules()}. If \code{NULL} (the default),
rules are fetched using the \code{draft_group_id}.}

\item{include_players}{A vector of player IDs to include. If \code{NULL} (the default), then use
all players found with \code{get_draftable_players()}.}

\item{exclude_players}{A vector of player IDs to exclude.}

\item{exclude_questionable}{Exclude players with statuses that indicate
they will not play. These include players that are questionable,
doubtful, out, and injured. Default is \code{FALSE}.}
}
\description{
Combine information needed for optimization.
Passed to \code{dk_optimize()}.
}
\examples{
  \dontrun{
    dk_prepare_schematic(draft_group_id = 80584)
  }

}
