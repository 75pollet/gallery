# Mygallery

## To contribute
Fork the this repo then clone from forked repo from you github account 

```$git clone https://github.com/your_username/gallery.git```



To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

create remote with name upstream i.e 

```$git remote add upstream https://github.com/75pollet/gallery.git```

Before working on issue ensure your local repo is upto date by running

```$git pull upstream develop```

When creating a branch ensure it has an issue number

For example issue #26 create user should be have branch name

`26-create-user`

Run 

```mix check_lint``` and    ```mix test```  and solve any arising issues before pushing

Upon making changes push to your remote 

```$git push origin branchname```

Your last commit message you be in the form `user schema fixes-#26`

Then create pull request if you feel the issue is completed