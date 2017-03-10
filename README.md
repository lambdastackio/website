### The LambdaStack Project Website
I use Hugo to build out our site so the structure of this repo is the default provided by Hugo. Any folders beginning with `_` are folders that I created such as `_scripts`.

I may use AWS S3 to host the site instead of Github but I will need to add directory to bucket mirroring to `s3lsio` first.

There are two publish scripts, one for gh-pages branch and one for docs on master branch.

The gh-pages script is called `_scripts/publish_to_ghpages.sh` that automatically maps the `/public/` directory to the `gh-pages` branch via git worktrees (this setup can be found in Hugo's documentation).

The docs script is called `_scripts/publish_to_ghdocs.sh` that automatically tells Hugo to build in the docs directory.

**NB: In both cases, if you use a custom domain then create a `CNAME` file in the `public` or `docs` directory (depending on which one you're using). Add your custom domain. In my case it's `lambdastack.io`.**

If you're on the Github Enterprise version then you can't use a custom domain.

### WordPress
I started with WordPress but quickly realized the architecture was just too old and highly prone to errors. Not to mention it's slow and uses outdated technology like PHP (horrible). However, there are some advantages to a DB oriented CMS but if you don't need to publish via a mobile device and you prefer to pay $0 for hosting then Hugo is a much better option.
