# Red101

* Ruby version: `~> 2.3.1`
* System dependencies: Postgres `~> 9.5.3`, Redis `~> 3.0.1`

# Development

`make bootstrap_development`

# Routes (controller#action:s)

1.  /                             root#index (materials#index?)
2.  /register                     profiles#new:create
3.  /login                        devices#new:create
4.  /password                     passwords#new:create
5.  /password/edit                passwords#edit:update
6.  /profile                      profiles#show
7.  /profile/edit                 profiles#edit:update

8.  /templates/1/diagnostics/new  diagnostics#new
9.  /diagnostics/1/edit           diagnostics#edit:update
10. /materials                    materials#recommended

11. /topics                       topics#index
12. /topics/new                   topics#new:create
13. /topics/1                     topics#destroy
14. /questions                    questions#index
15. /questions/new                questions#new:create
16. /questions/1                  questions#show:destroy
17. /questions/1/edit             questions#edit:update
18. /templates                    templates#index
19. /templates/new                templates#new:create
20. /templates/1                  templates#show:destroy
21. /templates/1/edit             templates#edit:update
22. /users                        users#index
23. /users/1                      users#show
