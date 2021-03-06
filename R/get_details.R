#' Get Details about a Video
#'
#' Get details such as when the video was published, the title, description, thumbnails, category etc.
#' 
#' @param video_id id of the video; required
#' @return list with the following elements - publishedAt, channelId, title, description, thumbnails, 
#' channelTitle, categoryId, liveBroadcastContent, localized, defaultAudioLanguage
#' 
#' @export
#' @references \url{https://developers.google.com/youtube/v3/}
#' @examples
#' \dontrun{
#' get_details(video_id="N708P-A45D0")
#' }

get_details <- function (video_id=NULL){
	
	if (is.null(video_id)) stop("Must specify a video ID")

	yt_check_token()

	querylist <- list(part="snippet", id = video_id)

	req <- GET("https://www.googleapis.com/youtube/v3/videos",  query=querylist, config(token =  getOption("google_token")))
	stop_for_status(req)
	res <- content(req)$items[[1]]$snippet

	# Return a list
	return(invisible(res))
}

