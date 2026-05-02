Blog posts
==========

for [https://itenium.be/blog](https://itenium.be/blog)

[Instructions on how to create a post and what is available](https://itenium.be/blog/productivity/create-blog-post/)

[Figma](https://www.figma.com/design/UMZVNMJLJMGPtKSR64OtJy/Itenium---Website--Extern-?node-id=1378-2466&p=f)

## Local Development

```ps1
bundle exec jekyll serve
bundle exec jekyll serve --incremental
bundle exec jekyll serve --drafts --incremental
```


## Authoring

Create a new draft with front matter from `_config.yml` and body from `Rakefile`
with [jekyll-compose](https://github.com/jekyll/jekyll-compose):

```ps1
rake draft["My new post"]
# → _drafts/2026-05-02-my-new-post.md
```



## Publish

- [all-blog-posts.xml](https://itenium-be.github.io/blog-posts-new/all-blog-posts.xml)
- [new-blog-posts.xml](https://itenium-be.github.io/blog-posts-new/new-blog-posts.xml)
