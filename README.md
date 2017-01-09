This program tracks user engagement with Facebook pages. Given a list of page IDs, it generates user data (e.g., likes and comments) for a specified number of posts. The data is output into a CSV file.

###Configuration

First, clone the repo, cd into the directory and run `bundle install`.

You'll then need to [get an access token from Facebook](https://developers.facebook.com/docs/facebook-login/access-tokens/).

Add an .env file. It should look something like this, but replace the placeholder with the token you just got:

```
FACEBOOK_ACCESS_TOKEN="YOUR_FACEBOOK_ACCESS_TOKEN"
```
If you prefer to set environment variables in the command line, you can do that instead:

```
export FACEBOOK_ACCESS_TOKEN="YOUR_FACEBOOK_ACCESS_TOKEN"
```

Add a file to the root of the directory called `input.csv`. This should contain the data you want to process. On each line, list the id of the Facebook page you want to check and the number of posts you want to search. For instance, `305736219467790,10` will query user interactions with the last 10 posts on Stagelink's Facebook page. Here's sample input for multiple pages:

```
305736219467790,10
249403588440524,10
107840939393927,15
```

Ouput comes in the following format:

```
user_id, page_id, post_id, post_type (e.g., "video"), interaction_type (e.g., "reaction") [, interaction_subtype (e.g., "LIKE")].
```

Finally, run the program from the lib directory with `ruby engagement_tracker.rb`.
