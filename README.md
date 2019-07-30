# Elm-quickstart template

It usually takes me a little bit of time to get started with a new elm project. But I wanna get started right away, as fast as possible! 🚀

I tend to copy-paste some boilerplate from other projects, so I collected some of it in this template repository. I hope to keep things simple while still providing functionality like recompiling on file changes etc.

This is tailored to my preferences, like using a simple `Makefile` to collect the various build/deploy/live-reload commands I need. I am open to changing things to make it more useful for other people.

I just found out about [GitHub templates](https://github.blog/2019-06-06-generate-new-repositories-with-repository-templates), which is a nice fit for this sort of setup. Just use the green button above.

## Dependencies

There are some basic dependencies that help my development workflow a lot:

- [`ripgrep`](https://github.com/BurntSushi/ripgrep)
- [`entr`](http://entrproject.org)
- [`uglifyjs`](https://github.com/mishoo/UglifyJS2)

Install the first two with your package manager of choice, on mac I just do `brew install ripgrep entr`.

Install `uglifyjs` with `npm install -g uglify-js`. This is used to massively reduce the file size of the resulting .js file, adapted from [https://guide.elm-lang.org/optimization/asset_size.html](https://guide.elm-lang.org/optimization/asset_size.html).

If anybody thinks that these dependencies could (and should) be simplified even further, I am open to suggestions and pull requests. Just open an issue to discuss.

## Go go go

After cloning this repo as a template (github: green button above), all you have to do is remove this glorious `README` and initialize the elm project:

```bash
rm Readme.md
elm init
```

Run `make help` to 

If you clone directly with `git clone`, remember to also nuke the local git repo:

```
rm -rf .git
git init
```

## Deployment

This template doesn't really include any deployment commands, since these generally differ a lot from project to project.

As an example, for a server you have ssh access to, using `rsync` as follows is my favourite. I only syncs modified files and it deletes anything on the target that was removed in your local folder:

```
rsync -crv -e ssh --delete site/ $(USER)@$(SERVER):$(FOLDER)
```

In other situations, I deploy on github-pages or the amazing [Netlify](https://netlify.com)!
