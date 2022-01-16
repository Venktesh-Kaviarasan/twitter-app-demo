# Twitter Sample App
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rubystyle.guide)

> CredAvenue Demo: Sample Twitter application using Ruby on Rails

Authors:
* Venktesh Kaviarasan
* Michael Hartil (credits)

| Dependencies | Version |
| --- | --- |
| Ruby | 2.7.5 |
| Rails | 6.1.4.1 |
| SQL lite3 | development profile|
| Postgresql | Prod |
| SMTP Server | Gmail |

---

* `Liniting/Static Code Analyzed` - Powered by Rubocop </br>
* `Language Servers` - Solargraph
* `Heroku CICD Pipeline: master (auto deploy)`
* `Prod URL`: [https://demo-twitter-app-ca.herokuapp.com](https://demo-twitter-app-ca.herokuapp.com)

## Process
```
$ bundle install --without production
```
```
$ rails db:migrate, rails db:seed
```
```
$ rails s
```
```
$ rails c --sandbox (dev)
```

## DB Schema
* `TODO` - Update in progress...