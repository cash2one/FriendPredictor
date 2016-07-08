UPDATE twitter_entity 
INNER JOIN 
(
    SELECT twitter_id, 
    MAX(tweet_id) maxtweet
    FROM tweets
	GROUP BY twitter_id
) tb ON tb.twitter_id = twitter_entity.twitter_id
SET twitter_entity.highest_pulled_tweet_id = tb.maxtweet

UPDATE twitter_entity 
INNER JOIN 
(
    SELECT twitter_id, 
    MIN(tweet_id) mintweet
    FROM tweets
	GROUP BY twitter_id
) tb ON tb.twitter_id = twitter_entity.twitter_id
SET twitter_entity.smallest_pulled_tweet_id = tb.mintweet;