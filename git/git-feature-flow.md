## What I want to do
* Define branch/jira name and copy it to the clipboard *OR* create worktree first and experiment.
  * 💡 just create a branch and the commit the description into the commit's message? Then it would be trivial to paste it into JIRA later.
    * This has an added benefit of throwing branch away if thing doesn't work.
* start the flow on my local machine
  * worktree dir
  * install
  * build
* Meanwhile Define jira description
* start an app
* do a fix
* check a fix


## What I actually have to do right now
1. Create a JIRA with *name*
1. Fill *Description*
1. Create a branch
1. Checkout branch locally
    * Create worktree
    * Checkout worktree
1. npm i and build common
1. navigate to app in question
1. start it
1. *do a fix*
1. *check fix*
1. push to remote
1. create a PR
1. ask to review
1. wait for review
1. merge
1. close JIRA ticket
1. *switch back to previous worktree*
1. merge/rebase in the fix to each other branch/worktree I have
    * The problem here is that I won't have rebuilded fresh versions after doing this merge/rebase